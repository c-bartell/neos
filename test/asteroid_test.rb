require 'minitest/autorun'
require 'minitest/pride'
require './lib/asteroid'

class AsteroidTest < Minitest::Test


  def test_it_exists
    name = '2011 GE3'
    diameter = '123 ft'
    miss_distance = '35542652 miles'
    assert_instance_of Asteroid, Asteroid.new(name, diameter, miss_distance)
  end
end
