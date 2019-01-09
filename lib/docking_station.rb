class DockingStation
  attr_reader :docked_bikes
  DEFAULT_CAPACITY = 20

  def initialize(n = DEFAULT_CAPACITY)
    @capacity = n
    @docked_bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @docked_bikes.pop
  end

  def dock(bike)
    fail "Docking station full" if full?
    @docked_bikes << bike
  end

  private

  def full?
    @docked_bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @docked_bikes.empty?
  end

end
