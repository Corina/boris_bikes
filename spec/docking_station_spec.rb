require "docking_station.rb"
require "bike.rb"

describe DockingStation do

  let(:docking_station) {DockingStation.new}
  let(:bike) { double :bike }


  it "allows users to set capacity" do
    p "two"
    num = 5
    station = DockingStation.new(num)
    expect(station.capacity).to eq num
  end

  it "starts with 20 as a default capacity" do
    p "three"
    expect(docking_station.capacity).to eq 20
  end

  it "gets a bike and expects it to be working" do
    p "four"
    bike = double(:bike, :working? => true)
    docking_station.dock(bike)
    bike = docking_station.release_bike
    expect(bike).to be_working
  end

  describe "#dock" do
    it "won't dock a bike if full" do
      p "five"
      docking_station.capacity.times { docking_station.dock bike }
      expect{docking_station.dock(bike)}.to raise_error("Docking station is full")
    end
  end


  describe "#release_bike" do
    it "can release a bike if there is a bike available" do
      p "six"
      bike = double(:bike, :working? => true)
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end

    it "won't release a bike if there are none available" do
      p "seven"
      expect{docking_station.release_bike}.to raise_error("No bikes available")
    end

    it "won't release a bike that's not working" do
      bike1 = double(:bike, :working? => false, :report_broken => true)
      bike1.report_broken
      p bike1.working?
      docking_station.dock(bike1)
      bike2 = double(:bike, :working? => true, :report_broken => true)
      docking_station.dock(bike2)
      expect(docking_station.release_bike).to be_working
    end

    it "raises an error if there are no working bikes" do
      bike = double(:bike, :working? => false, :report_broken => true)
      #bike.report_broken
      docking_station.dock(bike)
      expect{docking_station.release_bike}.to raise_error("No working bikes available")
    end

  end

end
