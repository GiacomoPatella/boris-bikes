require_relative "../lib/van"
require_relative "../lib/bike_container"
require_relative "../lib/bike"

describe Van do

  include BikeContainer
  
  let(:bike) { Bike.new }
  let(:van) { Van.new(:capacity => 20) }

  it "should know its max capacity" do
    expect(van.capacity).to eq(20)
 end

  it 'should only accept broken bikes' do
    good_bike, bad_bike = Bike.new, Bike.new
    bad_bike.break
    docking_station = double(:docking_station, :release=>nil, :bikes_for_van => [bad_bike])
    # docking_station.stub(:release)
    # expect(docking_station).to receive(:release)
    van.load_bikes_from(docking_station)
    expect(van.bike_count).to eq(1)
  end

end
