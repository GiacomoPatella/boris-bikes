require_relative "../lib/bike_container"
require_relative "../lib/docking_station"


class Van

 include BikeContainer
 

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end




end

    

  # def load_bikes_from(source)
  #   # bikes_to_take = source.is_a?(DockingStation) ? source.broken_bikes : source.available_bikes
  #   bikes_to_take = source.bikes_for_van
  #   bikes_to_take.each do |bike|
  #     self.dock(bike)      
  #     source.release(bike)
  #   end
  # end

# load_bikes_from(DockingStation)
# load_bikes_from(Garage) 

  # def load_bikes_from(source)
  #   bikes_to_take = source.bikes_for_van
  #   exchange_bikes_from(source,bikes_to_take)
  # end

  # private
  # def exchange_bikes_from(source,bikes_to_take)
  #   bikes_to_take.each do |bike|
  #     self.dock(bike)      
  #     source.release(bike)
  #   end
  # end

  # def load_bikes
  #   if at_garage
  #     load_bikes_from(source, :broken_bikes)
  #   else
  #     load_bikes_from(source)
  #   end
  # end



