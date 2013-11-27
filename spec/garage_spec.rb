require_relative '../lib/bike'
require_relative "../lib/garage"

describe Garage do

    let(:bike) { Bike.new }
    let(:garage) { Garage.new(:capacity => 20) } 

    it "should accept a bike" do
    expect(garage.bike_count).to eq(0)
    garage.dock(bike)
    expect(garage.bike_count).to eq(1)
  end

   it "should release a bike" do
    garage.dock(bike)
    garage.release(bike)
    expect(garage.bike_count).to eq(0)
  end

  it "should know when it's full" do
    expect(garage).not_to be_full
    fill_garage garage
    expect(garage).to be_full
  end

  it "should not accept a bike if it's full" do
    fill_garage garage
    expect(lambda { garage.dock(bike) }).to raise_error(RuntimeError)
  end

  def fill_garage(garage) # helper method
    20.times { garage.dock(Bike.new) }
  end


  xit 'should allow setting default capacity on initialising' do
    expect(garage.capacity).to eq(123)
  end

  it 'should fix a bike' do
    # bike = double(:bike)
    expect(bike).to receive(:fix)
    garage.dock(bike)
  end


end