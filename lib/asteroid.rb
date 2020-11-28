class Asteroid
  attr_reader :name, :diameter, :miss_distance

  def initialize(name, diameter, miss_distance)
    @name = name
    @diameter = diameter
    @miss_distance = miss_distance
  end
end
