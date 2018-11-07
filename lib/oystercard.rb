class Oystercard
  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_use = false
    @entry_station = nil
  end

  def top_up(amount)
  	fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount > MAXIMUM_BALANCE)
    @balance += amount.to_i
  end

  def touch_in(station)
    fail "Insufficient funds for journey" if @balance < MINIMUM_FARE
    @in_use = true if @in_use == false
    @entry_station = station
  end

  def touch_out
    @in_use = false if @in_use == true
    deduct(MINIMUM_FARE)
    @entry_station = nil
	end

  def in_journey?
  	!@entry_station.nil?
  end

private
  def deduct(amount)
    @balance -= amount
  end


end
