require_relative "../lib/bike_container"
require_relative "../lib/docking_station"


class Van

 include BikeContainer
 

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end


    # broken_bikes.fetch.dock

  def load_bikes_from(source)
    # bikes_to_take = source.is_a?(DockingStation) ? source.broken_bikes : source.available_bikes
    bikes_to_take = source.bikes_for_van
    bikes_to_take.each do |bike|
      self.dock(bike)      
      source.release(bike)
    end
  end

# load_bikes_from(DockingStation)
# load_bikes_from(Garage) 

end

