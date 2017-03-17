require_relative 'docking_station'

class Van
attr_reader :van_bikes

def initialize
  @van_bikes = []
end


def van_bikes
 @van_bikes
end

def van_bikes_set(bikes_to_repair)
  @van_bikes = bikes_to_repair
end

end


#def van_bikes_set = (argument)
#  @van_bikes = argument
#end
