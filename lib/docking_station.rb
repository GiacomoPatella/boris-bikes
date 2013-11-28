class DockingStation

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end


  def broken_bikes
    bikes.select {|bike| bike.broken? }
  end


  def broken_bikes_count
    broken_bikes.count
  end

  # def bikes_for_van
  #   broken_bikes
  # end

end