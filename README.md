
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
![Imgur](https://i.imgur.com/KHEeyvF.png)

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

## The following endpoints are built for the platform:

#### 1. Questions

```ruby
   GET /api/v1/questions
```   
Returns a collection of comic-themed, multiple choice trivia questions, and their correct answers. The correct answer is included in the "answers" array, in a random (shuffled) position.
Example response:
```
   {
    "data": [
        {
            "id": "1",
            "type": "question",
            "attributes": {
                "id": "1",
                "question": "In Marvel Comics, Taurus is the founder and leader of which criminal organization?",
                "correct_answer": "Zodiac",
                "answers": [
                    "The Union",
                    "Scorpio",
                    "Zodiac",
                    "Tiger Mafia"
                ]
            }
        }
     ]
   }
```
***
#### 2. High Scores (all users)

```ruby
   GET /api/v1/scores?GEO_SCOPE=USER_LOCATION
```
GEO_SCOPE is an _optional_ parameter for filtering results. Options for GEO_SCOPE include
   - city
   - state
   - country
The following are all valid calls:
```ruby
   GET /api/v1/scores?city=Denver
   GET /api/v1/scores?state=Colorado
   GET /api/v1/scores?country=United+States
```

If left out, this endpoint will return unfiltered results from any location.
***
#### 3. High Scores (single user)

```ruby
   GET /api/v1/scores/:id params: {user_id: user.id}
```
Returns an individual user's highest score.
***
#### 4. Record a Game

```ruby
   POST /api/v1/scores 
```
Record new scores to the database. Must include the following information:
???
***
#### 5. User Location

```ruby
   GET /api/v1/locations?ip_address=<user_ip_address>
```
Returns a user's city, state, and country to store game data and make comparing scores a breeze. Specify the user's actual IP Address as a required query parameter. Without it, incorrect locations may be returned.

Example Response:
```
{
    "data": {
        "id": null,
        "type": "location",
        "attributes": {
            "city": "Denver",
            "state": "Colorado",
            "country": "United States"
        }
    }
}
```

## APIs

<!-- Potentially add links to the APIs we are using or move the description to this section -->
