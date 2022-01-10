# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

score_1 = Score.create(score: 100,
              game_time: 1.5,
              user_id: 1,
              city: "Denver",
              state: "CO",
              country: "USA"
            )
score_2 = Score.create(score: 10,
              game_time: 1.3,
              user_id: 1,
              city: "Denver",
              state: "CO",
              country: "USA"
            )
score_3 = Score.create(score: 50,
              game_time: 1.0,
              user_id: 2,
              city: "Denver",
              state: "CO",
              country: "USA"
            )
score_4 = Score.create(score: 100,
              game_time: 2.2,
              user_id: 3,
              city: "Chicago",
              state: "IL",
              country: "USA"
            )

score_5 = Score.create(score: 100,
              game_time: 0.04,
              user_id: 3,
              city: "Athens",
              state: "nil",
              country: "Greece"
            )
score_6 = Score.create(score: 100,
              game_time: 1.6,
              user_id: 4,
              city: "Athens",
              state: "nil",
              country: "Greece"
            )
score_7 = Score.create(score: 5,
              game_time: 100,
              user_id: 5,
              city: "Detroit",
              state: "MI",
              country: "USA"
            )
score_8 = Score.create(score: 150,
              game_time: 60.3,
              user_id: 7,
              city: "Chicago",
              state: "IL",
              country: "USA"
            )
score_9 = Score.create(score: 250,
              game_time: 1.5,
              user_id: 5,
              city: "Tampa",
              state: "FL",
              country: "USA"
            )
score_10 = Score.create(score: 8000,
              game_time: 4.20,
              user_id: 69,
              city: "Las Vegas",
              state: "NV",
              country: "USA"
            )
