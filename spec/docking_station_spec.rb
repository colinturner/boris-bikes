require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}

  # it 'releases working bikes' do
  #   bicycle = subject.release_bike
  #   expect(bicycle).to be_working
  # end

  it { is_expected.to respond_to(:dock).with(1).argument}

  it {is_expected.to respond_to(:bikes) }

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  # it 'has a default capacity' do
  #   expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  # end


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

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Sorry, this docking station is full'
    end
  end


  describe 'initialization' do
    it 'allows user to set capacity' do
      station = DockingStation.new(98)
      98.times {station.dock Bike.new}
      expect {station.dock Bike.new}.to raise_error 'Sorry, this docking station is full'
    end

    subject {DockingStation.new}
    let (:bike) {Bike.new}
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike)}.to raise_error 'Sorry, this docking station is full'
    end
  end

end
