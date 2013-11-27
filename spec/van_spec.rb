require_relative "../lib/van"
require_relative "../lib/bike_container"
require_relative "../lib/bike"

describe Van do
  
  let(:bike) { Bike.new }
  let(:van) { Van.new(:capacity => 20) }

  it "should know its max capacity" do
    van.capacity
  expect(van.capacity).to eq(20)
 end

end