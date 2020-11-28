require 'minitest/autorun'
require 'minitest/pride'
require './lib/asteroid'

class AsteroidTest < Minitest::Test
  def setup
    @name = '2011 GE3'
    @diameter = '123 ft'
    @miss_distance = '35542652 miles'
    @asteroid = Asteroid.new(@name, @diameter, @miss_distance)
  end

  def test_it_exists
    assert_instance_of Asteroid, @asteroid
  end
end
