require 'oystercard'

describe Oystercard do
	it "responds to :balance" do
		expect(subject).to respond_to(:balance)
	end
end
