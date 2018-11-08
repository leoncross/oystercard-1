require 'journey'

describe Journey do
  let(:station) { double :station, zone: 1}


  it "checks if you are in journey after touched in" do
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

  it "after touch_in, it stores the station you tapped into" do
    subject.touch_in(station)
    expect(subject.current_journey[:entry_station]).to eq station
  end

  it "stores the entry station" do
    subject.touch_in(station)
    expect(subject.current_journey[:entry_station]).to eq station
  end

  it "stores the full journey" do
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.journeys.length).to eq 1
  end

  it "provides a stored hash of the journey within an array" do
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.journeys).to eq [{:entry_station => station, :exit_station => station}]
  end
	it "ensures journeys start off as 0 by default" do
	   expect(subject.journeys.length).to eq 0
  end

  it "completes a full fare and returns 1" do
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.fare).to eq Journey::MINIMUM_FARE
  end

  it "completes a penalty (in) fare and returns 6" do
    subject.touch_in(station)
    expect(subject.fare).to eq Journey::PENALTY
  end

  it "completes a penalty (out) fare and returns 6" do
    subject.touch_out(station)
    expect(subject.fare).to eq Journey::PENALTY
  end

  it "expects complete? to show a completed journey" do
    subject.touch_out(station)
    expect(subject.complete?).to be_truthy
  end

  it "expects complete? to show a completed journey" do
    subject.touch_in(station)
    expect(subject.complete?).to be_falsy
  end
end
