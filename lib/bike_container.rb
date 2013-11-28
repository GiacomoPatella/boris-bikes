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


  def bike_count
    bikes.count
  end

  
  def dock(bike)
    raise "Station is full" if full?
    bikes << bike
  end

  
  def release(bike)
    raise "This is not a bike" if !bike.is_a? Bike
    bikes.delete(bike) 
  end


  # def empty?
  #   bike_count == 0
  # end

  
  def full?
    bike_count == capacity
  end


  def available_bikes
    bikes.reject {|bike| bike.broken? }
  end


    def load_bikes_from(source, method = :available_bikes)
    bikes_to_take = source.send(method)
    bikes_to_take.each do |bike|
      self.dock(bike)      
      source.release(bike)
    end
  end

end