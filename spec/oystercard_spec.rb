require 'oystercard'

describe Oystercard do
	describe "#balance" do
		it "responds to :balance" do
			expect(subject).to respond_to(:balance)
		end
	end

	describe "#top_up" do
		it "tops up the balance of the oystercard" do
			expect{ subject.top_up 5 }.to change{ subject.balance }.by 5
		end

		it "enforce the upper limit of the card" do
			maximum_balance = Oystercard::MAXIMUM_BALANCE
			expect{ subject.top_up(maximum_balance+1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
		end
	end

	describe "#deduct" do
		it "deducts the correct fair from balance" do
			subject.top_up(5)
			subject.deduct(3)
			expect(subject.balance).to eq(2)
		end
	end
end
