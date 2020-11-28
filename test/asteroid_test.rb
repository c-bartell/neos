require 'minitest/autorun'
require 'minitest/pride'
require './lib/asteroid'

class AsteroidTest < Minitest::Test


  def test_it_exists
    assert_instance_of Asteroid, Asteroid.new(name, diameter, miss_distance)
  end
end
