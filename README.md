== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

System dependencies

`Ruby version: 4.3.0`

`rails: 4.2.8`

Configuration

`cp .env.sample .env`

`cp config/database.yml.sample config/database.yml`

Database creation

`bundle exec rake db:create`

`bundle exec rake db:migrate`

Database initialization

`bundle exec rake db:seed`

run `rails c` to get User auth token from first User.

How to run the test suite

`bundle exec rspec spec/`

Run test API

* Run `rails s` to start server
* Use Postman or request the api in browser.
* `localhost:3000/api/v1/users?auth_token=<USER_AUTH_TOKEN>`
