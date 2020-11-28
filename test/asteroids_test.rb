require 'minitest/autorun'
require 'minitest/pride'
require './lib/asteroid.rb'
require './lib/asteroids.rb'

class AsteroidsTest < Minitest::Test
  def setup
    @asteroid_1 = Asteroid.new('(2011 GE3)', 123, 35542652)
    @asteroid_2 = Asteroid.new('(2019 FT)', 512, 5503325)
    @asteroid_3 = Asteroid.new('(2019 GN3)', 537, 35277204)
    @asteroids = Asteroids.new([@asteroid_1, @asteroid_2, @asteroid_3])
  end

  def test_it_exists
    assert_instance_of Asteroids, @asteroids
  end

  def test_it_has_attributes
    expected = [@asteroid_1, @asteroid_2, @asteroid_3]
    assert_equal @asteroids.list, expected
  end

  def test_it_can_find_largest_asteroid_diameter
    assert_equal @asteroids.largest_asteroid_diameter, @asteroid_3.diameter
  end
end
