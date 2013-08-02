require 'spec_helper'

describe User do
  it "must have a name" do
    user = FactoryGirl.build(:user, name: nil)
    user.should_not be_valid
  end

end
