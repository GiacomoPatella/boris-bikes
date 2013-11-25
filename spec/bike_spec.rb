# link to the Bike class
require_relative "../lib/bike"

# We're describing the functionality of a specific class, Bike
describe Bike do 
# this is a specific feature (beahviour) that we expect to be present
it "should not be broken after we create it" do
  bike = Bike.new # intialise a new object of Bike class
  expect(bike).not_to be_broken # expect an instance of this class to have a method "broken?" that should return false
  
  end

  it "should be able to break" do
    bike = Bike.new
    bike.break
    expect(bike).to be_broken
  end
end