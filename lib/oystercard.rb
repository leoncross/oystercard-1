class Oystercard
  attr_reader :balance, :entry_station, :current_journey, :journeys

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @journey = Journey.new
    @balance = 0

  end

  def top_up(amount)
  	fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount > MAXIMUM_BALANCE)
    @balance += amount.to_i
  end

  def touch_in(station)
    fail "Insufficient funds for journey" if @balance < MINIMUM_FARE

  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
	end

  def in_journey?
  	!!@journey.in_journey?
  end

private
  def deduct(amount)
    @balance -= amount
  end


end
