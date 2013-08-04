# SawyerHill Activity Coordination System

This is a demo app of an activity coordination system. It allows you to create activities and then create events for those activities, for example, you could have the activity "BBQ" and the associated event would be the BBQ I'm hosting next Thursday.Users can choose to follow specific activities, and they will then see events for that given activity in their events list. The application requires the user to sign in with Twitter.

## Demo

You can see the demo running live here: http://shacs.herokuapp.com/

You will need to sign in with Twitter to use it. Don't worry I'm not messing with your Twitter account. Feel free to mess with the data in the application, that's what it is for!

## Gems

Some of the interesting gems I am using:

* slim: because ERB is a pain in the butt
* formtastic: nice and simple forms
* bourbon: SCSS wizardry
* neat: A really cool grid layout system
* omniauth: For twitter login
* rspec: for specs, duh
* factory_girl: create those test objects
* poltergeist: test with capybara/phantomjs
* timecop: time travel in your tests!
