
# README

### Bragging Rights Comic Trivia Challenge (2 week sprint)
### Chaz Simons, Sam Devine, Matthew Kimball, Ted Staros & Christian Valesares
---

"Bragging Rights" is a trivia competition that consumes an open trivia api and IP address locator api and uses Twitter OAth to allow users to prove they have the most comic related trivia in their area.

## Architecture
This app is created with a service oriented architecture.

## Schema
<img width="658" alt="Bragging Rights Shcema copy" src="https://app.dbdesigner.net/designer/schema/488102">

## Tools Used:
- Rails 5.2.6
- Ruby 2.7.2
- PostgreSQL
- Heroku (https://frozen-peak-55560.herokuapp.com)
- Twitter OAth
- Circle CI

## Setup

* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## The following pages are built for the platform:
- Login
- Dashboard
- Trivia Questions
- Highscores

## APIs

<!-- Potentially add links to the APIs we are using or move the description to this section -->
