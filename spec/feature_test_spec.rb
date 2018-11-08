require 'oystercard'


describe Oystercard do

  let(:station) {'station'}


    it "completes a full cycle" do
      card = Oystercard.new
      card.top_up(10)
      card.touch_in(station)
      card.touch_out(station)
      expect(card.balance).to eq (9)
    end

    it "completes a penalty cycle" do
      card = Oystercard.new
      card.top_up(10)
      card.touch_out(station)
      expect(card.balance).to eq (4)
    end
    it "completes a penalty cycle" do
      card = Oystercard.new
      card.top_up(10)
      card.touch_in(station)
      card.touch_in(station)
      expect(card.balance).to eq (4)
    end
end
