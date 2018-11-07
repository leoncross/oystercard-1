class Journey
  attr_reader :current_journey, :journeys

def initialize
  @journeys = []
  @current_journey = {}
  @penalty = "no"

end

def touch_in(station)
  @current_journey[:entry_station] = station
end

def touch_out(station)
  @current_journey[:exit_station] = station
  @journeys << @current_journey
  @penalty = "yes" if @current_journey.has_key?(:entry_station)
end

def fare
  @penalty == "no" ? 6 : 1
end

def in_journey?
  !!@current_journey.has_key?(:entry_station)
end


end
