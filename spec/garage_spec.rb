require_relative "../lib/garage"

describe Garage do

    let(:bike) { Bike.new }
    let(:garage) { Garage.new(:capacity => 20) } 