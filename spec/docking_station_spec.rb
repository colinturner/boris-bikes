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

    bike = double(:bike, broken: true)
    expect(subject.dock(bike)).to eq [bike]


  end

  it 'returns working bike' do
    bike = double(:bike, broken: false)
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  it 'returns broken bike' do
    bike = double(:bike, broken: true)
    subject.dock(bike)
    expect(subject.brokenbikes).to eq [bike]
  end

  # it 'has a default capacity' do
  #   expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  # end


  describe '#release_bike' do
    let(:bike) { double :bike }

    it 'releases a bike' do
  #    bike = double(:bike)
      # allow(bike).to receive(:broken?).and_return(false)
      bike = double(:bike, broken: false)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No working bikes available'
    end

    it 'does not release one broken bike' do
      # allow(bike).to receive(:report_broken).and_return(true)
      # allow(bike).to receive(:broken?).and_return(true)
      # subject.dock double(:bike, report_broken: true, broken?: true)
      bike = double(:bike, report_broken: true, broken: true)
      subject.dock bike
      expect {subject.release_bike}.to raise_error 'No working bikes available'
    end

    it 'raises an error when all docked bikes are broken' do
    #  allow(bike).to receive(:report_broken).and_return(true)
    #  allow(bike).to receive(:broken?).and_return(true)
      bike = double(:bike, report_broken: true, broken: true)
      bikes = []
      5.times {bikes.push(bike)}
      bikes.map {|bike| bike.report_broken }
      bikes.each { |bike| subject.dock(bike) }
      expect {subject.release_bike}.to raise_error 'No working bikes available'
    end

    it 'releases working bikes' do
      # allow(bike).to receive(:broken?).and_return(false)
      # allow(bike).to receive(:working?).and_return(true)
      subject.dock double(:bike, broken: false, working?: true)
      bike = subject.release_bike
      expect(bike).to be_working
    end

  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock double(:bike, broken: true) }
      expect { subject.dock double(:bike) }.to raise_error 'Sorry, this docking station is full'
    end
    # it 'fails to dock broken bike' do
    #   expect { subject.dock(Bike.new(true)) }.to raise_error 'Bike Broken - docking failed'
    # end
  end



  describe 'initialization' do
    it 'allows user to set capacity' do
      bike = double(:bike, broken: false)
      station = DockingStation.new(98)
      98.times {station.dock bike}
      expect {station.dock bike}.to raise_error 'Sorry, this docking station is full'
    end

    subject {DockingStation.new}
    let (:bike) {double(:bike, broken: false)}
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike)}.to raise_error 'Sorry, this docking station is full'
    end
  end

  describe '#report' do
    it { is_expected.to respond_to(:report).with(1).argument}
    #it 'if a bike working' do
    #  bike = Bike.new

    #end
  end

end
