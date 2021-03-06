require_relative "../lib/bike_container.rb"
require_relative "../lib/bike"
require_relative "../lib/docking_station"
require_relative "../lib/garage"


class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

  let(:bike) { Bike.new }
  let(:holder) { ContainerHolder.new }

  def fill_holder(holder)
    holder.capacity.times {holder.dock (Bike.new)}
  end


  it "should accept a bike" do
    expect(holder.bike_count).to eq(0)
    holder.dock(bike)
    expect(holder.bike_count).to eq(1)
  end

   it "should release a bike" do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  it "should know when it's full" do
    expect(holder).not_to be_full
    fill_holder holder
    expect(holder).to be_full
  end


  it "should not accept a bike if it's full" do
    fill_holder holder
    expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
  end


   it "should provide the list of available bikes" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([working_bike])
  end


  # make release nethod more solid
  #----------------------------------


  it "should not release a bike that's not there" do
     expect(holder.release(bike)).to be_nil
  end

  it "should give an error when trying to release something that's not a bike" do
    expect{holder.release("not_bike")}.to raise_error("This is not a bike")

  end


end


describe DockingStation do

  let(:station) {DockingStation.new(:capacity => 123)}

  it 'should allow setting default capacity on initialising' do
    expect(station.capacity).to eq(123)
  end
end

  
describe Garage do
    let(:garage) {Garage.new(:capacity => 123)}

    it 'should allow setting default capacity on initialising' do
      expect(garage.capacity).to eq(123)
    end
end