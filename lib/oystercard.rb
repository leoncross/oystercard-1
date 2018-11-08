require_relative "journey"

class Oystercard
  attr_reader :balance, :entry_station, :current_journey, :journeys

  MAXIMUM_BALANCE = 90

  def initialize
    @journey = Journey.new
    @balance = 0
  end

  def top_up(amount)
  	fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount > MAXIMUM_BALANCE)
    @balance += amount.to_i
  end

  def touch_in(station)
    fail "Insufficient funds for journey" if @balance < Journey::MINIMUM_FARE
    deduct if @journey.current_journey.has_key?(:entry_station)
    @journey.touch_in(station)
  end

  def touch_out(station)
    @journey.touch_out(station)
    deduct
	end

  def in_journey?
  	@journey.in_journey?
  end

private
  def deduct
    @balance -= @journey.fare
  end


end
