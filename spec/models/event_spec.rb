require 'spec_helper'

describe Event do
  it "should have the correct date, hour, minute, am" do

    Timecop.freeze(Time.local(2013, 9, 1, 10, 5, 0)) do
      event = FactoryGirl.build(:event)
      event.set_initial_time
      event.start_date.should eq('09/1/2013')
      event.start_hour.should eq('10')
      event.start_minute.should eq('0')
      event.start_am_pm.should eq('am')
    end
  end

  it "should have the correct date, hour, minute, pm" do
    Timecop.freeze(Time.local(2013, 9, 1, 12, 50, 0)) do
      event = FactoryGirl.build(:event)
      event.set_initial_time
      event.start_date.should eq('09/1/2013')
      event.start_hour.should eq('12')
      event.start_minute.should eq('45')
      event.start_am_pm.should eq('pm')
    end

  end
end
