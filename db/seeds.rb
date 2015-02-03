# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#require 'rest-client'

SportsDataApi.set_key(:nfl, '6fz94vjgb6spdc9p3gx9axuk') # be sure to change this to your key

#stores entire 2014 NFL schedule in sch14 variable
season = SportsDataApi::Nfl.schedule(2014, :REG)

#add these two lines to dismiss all after loop.
#season.each.week do |week|
#	weeks.game.each do |game|
#end

#box.SportsDataApi::Nfl.boxscore(2014, :REG, game.week, game.home, game.away)

# All Home teams for the season
   home_teams = season.weeks.collect do |all_weeks|
    all_weeks.games.collect do |all_games|
       all_games.home
     end
   end.flatten

# All Away teams for the season
   away_teams = season.weeks.collect do |all_weeks|
    all_weeks.games.collect do |all_games|
       all_games.away
     end
   end.flatten

 # All Weeks (numbers) for the season
  all_weeks = season.weeks.collect do |all_weeks|
   all_weeks.games.collect do |all_games|
     all_games.week
   end
 end.flatten


   # Loops through 256 times 
256.times do |i|

box = SportsDataApi::Nfl.boxscore(2014, :REG, all_weeks[i], home_teams[i], away_teams[i])
      Game.create(date: box.scheduled, home_team_id: Team.where(name: box.home_team.name).pluck(:id).first, 
      away_team_id: Team.where(name: box.away_team.name).pluck(:id).first, home_score: box.home_team.points,
      away_score: box.away_team.points)

sleep 1

end