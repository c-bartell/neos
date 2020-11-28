require 'minitest/autorun'
require 'minitest/pride'
require './lib/asteroid'

class AsteroidTest < Minitest::Test
  def setup
    @name = '2011 GE3'
    @diameter = 123
    @miss_distance = 35542652
    @asteroid = Asteroid.new(@name, @diameter, @miss_distance)
  end

  def test_it_exists
    assert_instance_of Asteroid, @asteroid
  end

  def test_it_has_attributes
    assert_equal @asteroid.name, @name
    assert_equal @asteroid.diameter, "#{@diameter} ft"
    assert_equal @asteroid.miss_distance, @miss_distance
  end

  def test_it_can_return_a_hash_of_data
    expected = {
      name: @name,
      diameter: diameter,
      miss_distance: "#{@miss_distance} miles"
    }

    assert_equal expected, @asteroid.data_hash
  end
end
