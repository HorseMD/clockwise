require File.dirname(__FILE__) + '/../lib/clockwise'
require 'coveralls'
Coveralls.wear!

RSpec.describe "Integer" do
  it "should respond to the new methods" do
    expect(1).to respond_to(:seconds)
    expect(55).to respond_to(:minutes)
    expect(22).to respond_to(:hours)
    expect(53).to respond_to(:days)
    expect(18).to respond_to(:weeks)
    expect(72).to respond_to(:months)
    expect(80).to respond_to(:years)
  end

  it "shouldnt respond to certain methods" do
    expect(1).to_not respond_to(:decades)
  end

  it "shouldnt allow 0 as an amount of time" do
    expect{0.hours.each_minute}.to raise_error(ArgumentError)
  end

  it "shouldn't allow negative numbers as an amount of time" do
    expect{-2.minutes.each_second}.to raise_error(ArgumentError)
  end

  it "shouldnt allow splitting of time units into parts greater than themselves" do
    expect{3.hours.each_year}.to raise_error(ArgumentError)
    expect{4.minutes.each_week}.to raise_error(ArgumentError)
  end

  it "should know that many smaller time units make larger units" do
    expect(24.hours).to equal(1.days)
    expect(4.weeks).to equal(1.months)
    expect(1.minutes).to equal(60.seconds)
    expect(120.seconds).to equal(2.minutes)
    expect(12.months).to equal(1.years)
  end

  it "should add time with 'and'" do
    expect(2.hours.and 5.minutes).to equal(7500)
    expect(4.days.and 11.hours).to equal(385200)
  end
end
