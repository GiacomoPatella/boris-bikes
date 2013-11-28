require_relative "../lib/van"
require_relative "../lib/bike_container"
require_relative "../lib/bike"
require_relative "../lib/garage"

describe Van do

  include BikeContainer
  
  let(:bike) { Bike.new }
  let(:van) { Van.new(:capacity => 20) }
  let(:garage) { Garage.new }

  it "should know its max capacity" do
    expect(van.capacity).to eq(20)
 end

  it 'should only accept broken bikes from docking station' do
    good_bike, bad_bike = Bike.new, Bike.new
    bad_bike.break
    docking_station = double(:docking_station, :release=>nil, :broken_bikes => [bad_bike])
    # docking_station.stub(:release)
    # expect(docking_station).to receive(:release)
    van.load_bikes_from(docking_station, :broken_bikes)
    expect(van.bike_count).to eq(1)
  end

  it 'should accept (fixed) bikes from garage' do
    garage.dock(bike)
    van.load_bikes_from(garage)
    expect(van.bike_count).to eq(1)
  end

end







# require_relative "../lib/van"
# require_relative "../lib/bike_container"
# require_relative "../lib/bike"
# require_relative "../lib/docking_station"

# describe Van do

#   include BikeContainer
  
#   let(:bike) { Bike.new }
#   let(:van) { Van.new(:capacity => 20) }
#   let(:docking_station) {DockingStation.new(:capacity => 20)}

#   it "should know its max capacity" do
#     expect(van.capacity).to eq(20)
#  end

#   it 'should only accept broken bikes' do
#     good_bike, bad_bike = Bike.new, Bike.new
#     bad_bike.break
#     docking_station.dock(bad_bike)
#     docking_station.dock(good_bike)
#     van.load_bikes_from(docking_station)
#     expect(van.bike_count).to eq(1)
#   end

# end
