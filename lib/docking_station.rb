require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  attr_reader :bikes, :brokenbikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @brokenbikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No working bikes available' if empty?
    bikes.pop
    # fail 'All Bikes Broken - cannot release bike' if bikes.all? {|i| i.broken? == true}
    # passing_bike = bikes.find {|i| i.broken? == nil || i.broken? == false }
    # bikes.delete(passing_bike)
    # passing_bike
  end

  def dock(bike)
      fail 'Sorry, this docking station is full' if full?
      bike.broken ? brokenbikes << bike : bikes << bike
  end

  def report(bike)
  end

  private


  def full?
    bikes.count + brokenbikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end
