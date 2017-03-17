require 'van'

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

  
end
