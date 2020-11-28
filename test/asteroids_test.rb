require 'minitest/autorun'
require 'minitest/pride'
require './lib/asteroid.rb'
require './lib/asteroids.rb'

class AsteroidsTest < Minitest::Test
  def setup
    @asteroid_1 = Asteroid.new('2011 GE3', '123 ft', '35542652 miles')
    @asteroid_2 = Asteroid.new
  end

  def test_it_exists

  end

  def test_it_has_attributes

  end
end
