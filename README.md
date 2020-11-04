# Just to do It
## README

Justodoit is a full rails application for to-do tracking. It offers real time notification for friends lists and an inifinite subitem system with automatic check completion :)

### Dependencies
 - [x] Ruby 2.7
 - [x] Rails 6.0.3
 - [ ] MySQL
 - [x] Redis (even on local)
 
### Deploys
  - [staging version](http://staging.justodoit.kukiel.tech/) is running on Heroku with the branch ['translations_and_some_layout'](https://github.com/gkm2806/justodoit/tree/feature/translations_and_some_layout)
  - ['production' version](http://justodoit.kukiel.tech/) is running on an AWS EC2 T2-micro machine
  
### Cloning 
  First you'll need to setup ruby (rvm highly recommended) and rails on your machine, I hapen to have a [good old gist](https://gist.github.com/gkm2806/69b5b24291039eaa5b84beba0e4a8003) for rails setup on ubuntu.
- `git clone https://github.com/gkm2806/justodoit.git` to clone the repository
- `gem install bundler`
- `bundler install`
- `rails db:create db:migrate db:seed` to start the database
- `rails s` to start the server

P.S.: Do not forget to start redis service

### Testing
   After clone this rep and follow the instructions, you just need to run `rake` to execute both the unit tests and the interface test. Unit tests, factories and test setup files can be found on `/spec` and the Capybara one is on `/features` (since it depends on cucumber)
   
### Known Problems
   Since the app is meant to run on sqlite, and Heroku *kindly* enforce the use of Postgres, there is some differences between staging and local instances, mainly on item ordering on lists.
