# SawyerHill Activity Coordination System

This is a demo app of an activity coordination system. It allows you to create activities and then create events for those activities, for example, you could have the activity "BBQ" and the associated event would be the BBQ I'm hosting next Thursday.Users can choose to follow specific activities, and they will then see events for that given activity in their events list. The application requires the user to sign in with Twitter.

## Demo

You can see the demo running live here: http://shacs.herokuapp.com/

You will need to sign in with Twitter to use it. Don't worry I'm not messing with your Twitter account. Feel free to mess with the data in the application, that's what it is for!

## Gems

Some of the interesting gems I am using:

* [slim](https://github.com/slim-template/slim): because ERB is a pain in the butt
* [formtastic](https://github.com/justinfrench/formtastic): nice and simple forms
* [bourbon](http://bourbon.io): SCSS wizardry
* [neat](https://github.com/thoughtbot/neat): A really cool grid layout system
* [omniauth](https://github.com/intridea/omniauth): For twitter login
* [rspec](http://rspec.info): for specs, duh
* [factory_girl](https://github.com/thoughtbot/factory_girl): create those test objects
* [poltergeist](https://github.com/jonleighton/poltergeist): test with capybara/phantomjs
* [timecop](https://github.com/travisjeffery/timecop): time travel in your tests!
