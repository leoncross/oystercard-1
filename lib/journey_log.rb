class JourneyLog

  attr_reader :journey

  def initialize #need to inject a class here??????

  end

  def start(station) # needs to create new instance of journey
    @journey.touch_in(station)

  end

  def finish(station)
    @journey.touch_out(station)
  end

  private

  def current_journey # needs to create new instance of journey IF incomplete
    @journey.current_journey.has_key?(:entry_station)
  end

  def journeys
  end

end
