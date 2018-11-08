class Journey
  attr_reader :current_journey, :journeys
  MINIMUM_FARE = 1
  PENALTY = 6
  def initialize
    @journeys = []
    @current_journey = {}
    @penalty = false
  end

  def touch_in(station)
    @current_journey[:entry_station] = station

  end

  def touch_out(station)
    @current_journey[:exit_station] = station
    @journeys << @current_journey
    @penalty = true if @current_journey.has_key?(:entry_station)
  end

  def fare
    !@penalty ? PENALTY : MINIMUM_FARE
  end

  def in_journey?
    !!@current_journey.has_key?(:entry_station)
  end

end
