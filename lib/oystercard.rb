class Oystercard
  attr_reader :balance, :entry_station, :current_journey, :journeys

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = []
    @current_journey = {}
  end

  def top_up(amount)
  	fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount > MAXIMUM_BALANCE)
    @balance += amount.to_i
  end

  def touch_in(station)
    fail "Insufficient funds for journey" if @balance < MINIMUM_FARE
    @entry_station = station
    @current_journey[:entry_station] = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @current_journey[:exit_station] = station
    @journeys << @current_journey
    @entry_station = nil
    @current_journey = {}
	end

  def in_journey?
  	!!@entry_station
  end

private
  def deduct(amount)
    @balance -= amount
  end


end
