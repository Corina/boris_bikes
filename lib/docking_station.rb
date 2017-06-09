require "./lib/bike.rb"

class DockingStation
  attr_reader :bikes, :capacity


  def initialize(capacity = 20)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "No bikes available" if empty?
    bike = nil
    @bikes.each_with_index do |x, index|
      if x.working?
        bike = x
        bikes.delete_at(index)
        break
      end
    end
    raise "No working bikes available" if bike == nil
    bike
  end


  def dock(bike)
    raise "Docking station is full" if full?
    @bikes << bike
  end

private
  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

end
