class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
  	fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount > MAXIMUM_BALANCE)
    @balance += amount.to_i
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
  	if @in_use == false
  		@in_use = true
  	else
  		fail "error"
  	end
  end

  def touch_out
 		if @in_use == true
  		@in_use = false
  	else
  		fail "error"
  	end
	end

  def in_journey?
  	@in_use
  end

end
