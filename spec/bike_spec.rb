require "bike.rb"

describe Bike do

  it "responds to working?" do
  p "bike one"
  expect(subject).to respond_to :working?
  end


  it "reports a bike as broken" do
    expect(subject.report_broken).to eq false
  end
end
