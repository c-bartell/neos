require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'json'
require './lib/near_earth_objects.rb'

class NearEarthObjectsTest < Minitest::Test
  def test_a_date_returns_a_list_of_neos
    results = NearEarthObjects.find_neos_by_date('2019-03-30')
    
    assert_equal '(2011 GE3)', results[:asteroid_list][0].name
    assert_equal '123 ft', results[:asteroid_list][0].diameter
    assert_equal '35542652 miles', results[:asteroid_list][0].miss_distance
  end
end
