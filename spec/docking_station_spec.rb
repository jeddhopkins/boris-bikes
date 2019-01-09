require 'docking_station'

describe DockingStation do

  it {is_expected.to respond_to :release_bike}

  # it "should return an instance of the Bike class when .release_bike method is called" do
  #   expect(subject.release_bike).to be_instance_of(Bike)
  #   expect(subject.release_bike.working?).to eq true
  # end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it "should not return an empty array once .dock has been called" do
    expect(subject.dock(2)).to eq [2]
  end
#  it {is_expected.to respond_to :display_bikes}

  it "should raise an error when release_bike is called, if docking station is empty," do
    expect{subject.release_bike}.to raise_error("No bikes available")if (subject.docked_bikes.empty?)
  end

  it 'should raise an error when dock is called, and station is at capacity' do
    expect{DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}}.to_not raise_error
    expect{subject.dock}.to raise_error("Docking station full")if (subject.docked_bikes.length > DockingStation::DEFAULT_CAPACITY)
  end



#   describe '#release_bike' do
#   it 'releases a bike' do
#     bike = Bike.new
#     subject.dock(bike)
#     # we want to release the bike we docked
#     expect(subject.release_bike).to eq bike
#   end
# end
end 
