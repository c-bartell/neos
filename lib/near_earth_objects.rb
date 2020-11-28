require 'faraday'
require 'figaro'
require 'pry'
require_relative 'asteroid.rb'
# Load ENV vars via Figaro
Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../../config/application.yml', __FILE__))
Figaro.load

class NearEarthObjects
  # This class's job is to pull and parse the raw JSON data ONLY
  # This method has too many responsibilities
  def self.find_neos_by_date(date)
    # This could possibly be a class on it's own, like a request class or something.
    conn = Faraday.new(
      url: 'https://api.nasa.gov',
      params: { start_date: date, api_key: ENV['nasa_api_key']}
    )
    asteroids_list_data = conn.get('/neo/rest/v1/feed')

    parsed_asteroids_data = JSON.parse(asteroids_list_data.body, symbolize_names: true)[:near_earth_objects][:"#{date}"]
    # Method should end here.

    largest_asteroid_diameter = parsed_asteroids_data.map do |asteroid|
      asteroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i
    end.max { |a,b| a<=> b}

    total_number_of_asteroids = parsed_asteroids_data.count
    formatted_asteroid_data = parsed_asteroids_data.map do |asteroid|
      Asteroid.new(
          asteroid[:name],
          asteroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i,
          asteroid[:close_approach_data][0][:miss_distance][:miles].to_i
      )
      # {
      #   name: asteroid[:name],
      #   diameter: "#{asteroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i} ft",
      #   miss_distance: "#{asteroid[:close_approach_data][0][:miss_distance][:miles].to_i} miles"
      # }
    end

    {
      asteroid_list: formatted_asteroid_data,
      # These could be class methods on a list of asteroids
      biggest_asteroid: largest_asteroid_diameter,
      total_number_of_asteroids: total_number_of_asteroids
    }
  end
end
