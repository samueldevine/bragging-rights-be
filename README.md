
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
This app uses a service-oriented architecture, with seperate frontend and backend rails applications. This is the **backend** repository. Users of Bragging rights don't interact with this repository directly, but rather through the frontend app [here](https://github.com/samueldevine/bragging-rights-fe). The backend application is responsible for making API calls to the APIs listed below, storing game data when users complete a quiz, and making that data available through several endpoints to be consumed by the frontend.

For a relatively small app like this, there aren't many advantages to choosing a SOA over a Rails monolith. However, gaining some exposure to SOA was one of our primary learning goals for this project, and we chose to implement it simply in pursuit of learning more about what it takes to build professional web applications in this style. 

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

## Endpoints

The backend API base path is:

```
https://fast-inlet-74665.herokuapp.com/api/v1/{query}
```
_{query}_ should be replaced with one of the following endpoints.

#### 1. Questions

```ruby
   GET questions
```   
Returns a collection of 5 comic-themed, multiple choice trivia questions, and their correct answers. The correct answer is included in the "answers" array, in a random (shuffled) position. The questions are limited to what is availabe in the [OpenTDB API](https://opentdb.com/api_config.php), so you may start to notice repeated questions on multiple calls. As of 01.12.22, only 50 questions can be returned.
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
#### 2. High Scores

```ruby
   GET scores
```

This endpoint will return 20 scores from the database, sorted from high to low. These results can optionally be filtered by location _or_ user (but not both) using the parameters below.

##### Parameters and Usage
   - `city={city}`
   - `state={state}`
   - `country={country}`
   - `user_id={user_id}`

The following examples are all valid calls:
```ruby
   GET /api/v1/scores?city=Denver
   GET /api/v1/scores?state=Colorado
   GET /api/v1/scores?country=United+States
   GET /api/v1/scores?user_id=1  # assumes there is a user with id = 1 in the database
```

***
#### 3. Record a Game

```ruby
   POST /api/v1/scores 
```
Record new scores to the database. Must include the following information:
???
***
#### 4. User Location

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

We used 3 different APIs in this project. They are listed below:
1. [Open Trivia Database](https://opentdb.com/api_config.php)
2. [IP Geolocation API](https://ip-api.com/)
3. [Twitter API](https://developer.twitter.com/en/docs/twitter-api)
