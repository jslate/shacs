require 'spec_helper'

describe User do

  it "must have a name" do
    user = FactoryGirl.build(:user, name: nil)
    user.should_not be_valid
  end

  it "knows it is following an activity" do
    activity = FactoryGirl.create(:activity)
    user = FactoryGirl.create(:user)
    user.follow(activity)
    user.reload
    user.is_following?(activity).should be_true
  end

end
