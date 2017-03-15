require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}

  # it 'releases working bikes' do
  #   bicycle = subject.release_bike
  #   expect(bicycle).to be_working
  # end

  it { is_expected.to respond_to(:dock).with(1).argument}

  it {is_expected.to respond_to(:bike) }

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock(bike)' do
    it 'raises an error when a second bike is docked in a full (1-bike) station' do
      subject.dock(Bike.new)
      expect { subject.dock(Bike.new)}.to raise_error 'Sorry, this docking station is full'
    end
  end

end
