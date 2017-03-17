require_relative 'docking_station'

class Van
attr_reader :van_bikes

def initialize
  @van_bikes = []
end

def van_bikes_set(bikes_to_repair, station)  #station.brokenbikes, station
  van_bikes = bikes_to_repair
#  station.brokenbikes = []
  remove_bikes_from_station(bikes_to_repair, station)
end

def remove_bikes_from_station(bikes_to_repair, station)
  bikes_to_repair.each {|i| station.delete(i)}
  van_bikes
end


#def remove_bikes_from_station(x)
#  x = []
#end

end
