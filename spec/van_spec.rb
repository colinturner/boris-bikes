require 'van'
require 'docking_station'

describe Van do

  describe '#van_bikes' do
    it 'responds to van_bikes method' do
    expect(subject).to respond_to :van_bikes
  end

  it 'returns an empty array when no bikes present in van' do
    expect(subject.van_bikes).to eq []
  end



  #  it 'returns an array of the bikes in van' do
  #    bike = double(:bike, broken: true)
  #    expect(subject.van_bikes).to eq [bike]
  #  end

  end


  describe '#van_bikes_set' do
    it 'sets the van_bikes variable to the argument given' do
      bike = Bike.new
      station = DockingStation.new
      bike.report_broken
      station.dock bike
      expect(subject.van_bikes_set(station.brokenbikes, station)).to eq [bike]
    end

    it 'removes broken bikes from docking station when collecting them' do
      bike = Bike.new
      station = DockingStation.new
      bike.report_broken
      station.dock bike
      subject.van_bikes_set(station.brokenbikes, station)
      expect(station.brokenbikes).to eq []
    end
  end


end
