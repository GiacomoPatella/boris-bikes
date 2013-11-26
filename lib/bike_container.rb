module BikeContainer

    DEFAULT_CAPACITY = 10

  def bikes 
    @bikes ||= []
  end

  # attr_accessor :capacity ||= DEFAULT_CAPACITY would 
  # refactor the 2 methods below
  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  # attr_writer :capacity refactors this below:
  def capacity=(value)
    @capacity = value
  end

  ##################################
  # station = DockingStation.new
  # station.capacity=(50) # calls  capacity=()

  def bike_count
    bikes.count
  end

  def dock(bike)
    raise "Station is full" if full?
    bikes << bike
  end

  def release(bike)
    bikes.delete(bike)
  end

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject {|bike| bike.broken? }
  end


end