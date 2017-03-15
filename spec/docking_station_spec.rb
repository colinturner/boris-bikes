require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}

  it 'releases working bikes' do
    bicycle = subject.release_bike
    expect(bicycle).to be_working
  end

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

end
