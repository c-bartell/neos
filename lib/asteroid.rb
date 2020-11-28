class Asteroid
  attr_reader :name, :miss_distance

  def initialize(name, diameter, miss_distance)
    @name = name
    @diameter = diameter
    @miss_distance = miss_distance
  end

  def diameter
    "#{@diameter} ft"
  end

  def data_hash
    {
      name: @name,
      diameter: diameter,
      miss_distance: "#{@miss_distance} miles"
    }
  end
end
