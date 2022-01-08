
![Imgur](https://i.imgur.com/lq0RgRC.png)

A Comic Trivia Challenge (2 week sprint)
----------------------------------------
### Chaz Simons, Sam Devine, Matthew Kimball, Ted Staros & Christian Valesares

![CircleCI](https://img.shields.io/circleci/build/github/samueldevine/bragging-rights-be/main)
![Ruby](https://img.shields.io/badge/Ruby-v2.7.2-red)
![Rails](https://img.shields.io/badge/Rails-v5.2.6-red)
---

"Bragging Rights" is a trivia competition app designed to consume two external APIs to gather questions and location data of players, and pass the information to our front-end application. It's also responsible for scoring games, containing the score and location data received from the players.


## Architecture
This app is created with a service oriented architecture.

## Schema
<img width="658" alt="Bragging Rights Schema copy" src="https://app.dbdesigner.net/designer/schema/488102">

## Tools Used:
- Rails 5.2.6
- Ruby 2.7.2
- PostgreSQL
- Heroku (https://fast-inlet-74665.herokuapp.com)
- Twitter OAth
- Circle CI

## Setup

* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:{create,migrate}`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## The following pages are built for the platform:
- Login
- Dashboard
- Trivia Questions
- Highscores

## APIs

<!-- Potentially add links to the APIs we are using or move the description to this section -->
