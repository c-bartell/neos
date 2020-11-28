require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'json'
require './lib/near_earth_objects.rb'

class NearEarthObjectsTest < Minitest::Test
  def setup
    @results = NearEarthObjects.find_neos_by_date('2019-03-30')
  end

  def test_a_date_returns_a_list_of_neos
    # results = NearEarthObjects.find_neos_by_date('2019-03-30')

    assert_equal 10, @results[:asteroid_list].count
    assert_equal '(2011 GE3)', @results[:asteroid_list][0].name
    assert_equal "123 ft", @results[:asteroid_list][0].diameter
    assert_equal 35542652, @results[:asteroid_list][0].miss_distance
  end

  def test_a_date_also_returns_largest_asteroid_and_number_of_asteroids
    assert_equal "537 ft", @results[:biggest_asteroid]
    assert_equal 10, @results[:total_number_of_asteroids]
  end
end
