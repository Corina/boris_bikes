class Bike

  def initialize(working = true)
    @working = working
  end

  def report_broken
    @working = false
  end

  def working?
    @working
  end
end
