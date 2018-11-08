require 'oystercard'

describe Oystercard do
	let(:station) {'station'}

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
		before (:each) do
			subject.top_up(10)
		end
		it "deducts the correct fare from balance" do
			subject.touch_out(station)
			expect(subject.balance).to eq(4)
		end
		it "makes sure the journey has been paid for" do
			subject.touch_in(station)
			expect{ subject.touch_out(station) }.to change{ subject.balance }.by -Journey::MINIMUM_FARE
		end
	end

	describe "#in-out" do
		before (:each) do
			subject.top_up(5)
			subject.touch_in(station)
		end

		it "checks if you are not in journey after touching out" do
			subject.touch_out(station)
			expect(subject).to_not be_in_journey
		end
	end

	describe "#touch-in" do
		it "checks that error is raised when insufficient funds on card" do
			expect{ (subject.touch_in(station)) }.to raise_error "Insufficient funds for journey"
		end

		it "stores the station you touch in at" do
			subject.top_up(5)
			expect(subject).to respond_to(:touch_in)
	end

		it "ensures it accepts 1 argument" do
			subject.top_up(5)
			expect(subject).to respond_to(:touch_in).with(1).argument
		end
	end

	describe "#entry station" do
		it "starts its life as nil" do
			expect(subject.entry_station).to eq nil
		end
	end
end
