require 'spec_helper'

describe Activity do
  it "must have a name" do
    activity = FactoryGirl.build(:activity, name: nil)
    activity.should_not be_valid
  end
end
