require 'spec_helper'

describe Event do

  before(:each) do
    Activity.destroy_all
  end

  it "should load the form" do
    visit '/auth/twitter'
    visit new_event_path
    page.should have_content('New Event')
  end

  it "should have activity in select" do
    visit '/auth/twitter'
    activity = FactoryGirl.create(:activity)
    visit new_event_path
    select(activity.name, from: 'Activity')
  end

  it "post the right values", js: true do

    Timecop.travel(Time.local(2013, 9, 1, 10, 5, 0)) do

      visit '/auth/twitter'

      visit new_activity_path
      fill_in 'Name', with: 'jam'
      click_button 'Save'

      visit new_event_path
      select('jam', from: 'Activity')
      fill_in 'Start date', with: '9/1/2013'
      select('9', from: 'event_start_hour')
      select('45', from: 'event_start_minute')
      select('pm', from: 'event_start_am_pm')
      fill_in 'Location', with: 'The White House'
      fill_in 'Notes', with: 'BYOB'
      click_button 'Save'

      page.should have_content('jam')
      page.should have_content('bert')
      page.should have_content('The White House')
      page.should have_content('September 1, 2013 at 9:45pm')
      page.should have_content('BYOB')
    end
  end

  it "don't see events for activities I don't follow", js: true do
    pending
  end

end
