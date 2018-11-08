require_relative "journey_log"


class Oystercard
  attr_reader :balance, :entry_station, :current_journey, :journeys

  MAXIMUM_BALANCE = 90

  def initialize
    @journeylog = JourneyLog.new
    @balance = 0
  end

  def top_up(amount)
  	fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount > MAXIMUM_BALANCE)
    @balance += amount.to_i
  end

  def touch_in(station)
    fail "Insufficient funds for journey" if @balance < Journey::MINIMUM_FARE
    deduct if @journeylog.current_journey
    @journeylog.start(station)
  end

  def touch_out(station)
    @journeylog.finish(station)
    deduct
	end

private
  def deduct
    @balance -= @journeylog::journey.fare
  end


end
