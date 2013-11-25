require_relative  "../lib/docking_station.rb"

describe DockingStation do

  it "should accepet a bike" do
    bike = Bike.new
    station = DockingStation.new
    # we expect the station to have 0 bikes
    expect(station.bike_count).to eq(0)
    # let's dock a bike in the station
    station.dock(bike)
    # now we expect the station to have 1 bike
    expect(station.bike_count).to eq(1)
  end

end
