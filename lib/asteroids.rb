class Asteroids
  attr_reader :list

  def initialize(array)
    @list = array
  end

  def largest_asteroid_diameter
    @list.max_by do |asteroid|
      asteroid.diameter
    end.diameter
  end
end
