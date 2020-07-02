# RUN `rails db:seed:from_pokemondb` to make valid data, otherwise will fail!!

User.destroy_all
Team.destroy_all
PokemonTeamMembership.destroy_all

# Users
red = User.create(name: "Red", username: "PkMn-trainer-red", password: "pikachu_25", about: "...")
cynthia = User.create(name: "Cynthia", username: "cynthia_001", password: "garchomp_445", about: "You won't win")
puts "Added #{red.username} and #{cynthia.username}!"

# Teams for the users
red_team = Team.create(name: "My Champion Team", description: "...", user_id: red.id)
cynthia_team = Team.create(name: "My Champion Team", description: "Just try and stop me", user_id: cynthia.id)
puts "Adds #{red_team.name} and #{cynthia_team.name} teams!"

# Associate pokemon to teams
red_team.pokemons << Pokemon.find_by(original_id: 25)
red_team.pokemons << Pokemon.find_by(original_id: 131)
red_team.pokemons << Pokemon.find_by(original_id: 143)
red_team.pokemons << Pokemon.find_by(original_id: 3)
red_team.pokemons << Pokemon.find_by(original_id: 6)
red_team.pokemons << Pokemon.find_by(original_id: 9)
red_team.save
puts "#{red_team.name} now has #{red_team.pokemons.length} Pokemon!"

cynthia_team.pokemons << Pokemon.find_by(original_id: 442)
cynthia_team.pokemons << Pokemon.find_by(original_id: 407)
cynthia_team.pokemons << Pokemon.find_by(original_id: 468)
cynthia_team.pokemons << Pokemon.find_by(original_id: 448)
cynthia_team.pokemons << Pokemon.find_by(original_id: 350)
cynthia_team.pokemons << Pokemon.find_by(original_id: 445)
cynthia_team.save
puts "#{cynthia_team.name} now has #{cynthia_team.pokemons.length} Pokemon!"
