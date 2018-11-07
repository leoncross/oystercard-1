require "station"

describe Station do
  it "responds to name" do
    expect(subject).to respond_to(:name)
  end

  it "responds to zone" do
    expect(subject).to respond_to(:zone)
  end
end
