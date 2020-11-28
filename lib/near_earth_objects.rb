require 'faraday'
require 'figaro'
require 'pry'
require_relative 'asteroid.rb'
require_relative 'asteroids.rb'
# Load ENV vars via Figaro
Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../../config/application.yml', __FILE__))
Figaro.load

class NearEarthObjects
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

    asteroids = self.create_asteroids(parsed_asteroids_data)

    total_number_of_asteroids = parsed_asteroids_data.count

    {
      asteroid_list: asteroids.list,
      biggest_asteroid: asteroids.largest_asteroid_diameter,
      # These could be class methods on a list of asteroids
      total_number_of_asteroids: total_number_of_asteroids
    }
  end

  def self.create_asteroids(parsed_asteroids_data)
    formatted_asteroid_data = parsed_asteroids_data.map do |asteroid|
      Asteroid.new(
        asteroid[:name],
        asteroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i,
        asteroid[:close_approach_data][0][:miss_distance][:miles].to_i
      )
    end

    Asteroids.new(formatted_asteroid_data)
  end
end
