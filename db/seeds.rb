# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

game = Game.create(score: 100,
              game_time: 1.5,
              user_id: 1,
              city: "Denver",
              state: "CO",
              country: "USA"
            )
game2 = Game.create(score: 10,
              game_time: 1.3,
              user_id: 1,
              city: "Denver",
              state: "CO",
              country: "USA"
            )
game3 = Game.create(score: 50,
              game_time: 1.0,
              user_id: 2,
              city: "Denver",
              state: "CO",
              country: "USA"
            )
game4 = Game.create(score: 100,
              game_time: 2.2,
              user_id: 3,
              city: "Chicago",
              state: "IL",
              country: "USA"
            )

game5 = Game.create(score: 100,
              game_time: 0.04,
              user_id: 3,
              city: "Athens",
              state: "nil",
              country: "Greece"
            )
game6 = Game.create(score: 100,
              game_time: 1.6,
              user_id: 4,
              city: "Athens",
              state: "nil",
              country: "Greece"
            )
game7 = Game.create(score: 5,
              game_time: 100,
              user_id: 5,
              city: "Detroit",
              state: "MI",
              country: "USA"
            )
game8 = Game.create(score: 150,
              game_time: 60.3,
              user_id: 7,
              city: "Chicago",
              state: "IL",
              country: "USA"
            )
game9 = Game.create(score: 250,
              game_time: 1.5,
              user_id: 5,
              city: "Tampa",
              state: "FL",
              country: "USA"
            )
game10 = Game.create(score: 8000,
              game_time: 4.20,
              user_id: 69,
              city: "Las Vegas",
              state: "NV",
              country: "USA"
            )
