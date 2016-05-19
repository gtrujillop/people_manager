# people_manager

BE for the People Manager System
================================

API deployed in Heroku, available in https://people-manager-api.herokuapp.com/
  Using:
 `Heroku Postgres`
 `Redis Cloud`
 `SendGrid`

Technical Details
=====================

This app uses ruby 2.2.0 and rails 4.2.0. Is a Rails API based on 'rails-api' gem. Also uses MySQL as Database in development env.

Development
=====================
- Clone this git repo
- be ensured about your ruby version
- run bundle
- install redis
- run the resque workers
- run migration `rake db:migrate`
- start rails server (rails server -p<<port>>)
