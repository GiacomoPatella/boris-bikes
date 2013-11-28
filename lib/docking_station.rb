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

  def bikes_for_van
    broken_bikes
  end


  # def full_with_broken_bikes?
  #   broken_bikes.count == capacity
  # end





end



















# class DockingStation

  # DEFAULT_CAPACITY = 10


  # def initialize(options = {})
  #   @capacity = options.fetch(:capacity) || DEFAULT_CAPACITY
  #   @bikes = []
  # end


  # def bike_count
  #   @bikes.count
  # end


#   def dock(bike)
#     raise "Station is full" if full?
#     @bikes << bike
#   end


#   def release(bike)
#     @bikes.delete(bike)
#   end


#   def full?
#     bike_count == @capacity
#   end


#   def available_bikes
#     @bikes.reject {|bike| bike.broken? }
#   end


# end