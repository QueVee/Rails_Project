#Select every team from the NFC North
Team.where(division: 'North').where(conference: 'NFC')

#Select every team with at least 11 wins
Team.where("wins: >= 11")

#Select every team with at least 8 wins that did not make the playoffs
Team.where("wins >= 8").where(playoff: '0')

#Rename every team with fewer than 4 wins "Losers"
Team.where("wins <= 4").update_all(name: 'Losers')

#Select every team that plays in a city of fewer than 5 million people, and the name of the city


#Select every AFC team that plays in a city that is shrinking in population
Team.where(conference: 'AFC').joins(:city).where('cities.population_change < 0')

#Select every city that has a team


#Select every state that has a team


#Select every team that plays in California


#Find the 3 smallest cities with NFL teams


#Find the number of teams in cities of between 1 million and 2 million (as of 2013)
#Find the division with the largest average number of wins
Team.where(conference: 'NFC', division: 'North').average(:wins).to_f

['NFC', 'AFC'].each do |conference|
	['North', 'South', 'East', 'West'].each do |division|
		avg = Team.where(conference: conference, division: division).average(:wins).to_f
		pp "#{conference} #{division} #{avg}"

#List the names of the teams of the AFC in descending order of the size of their cities
#Change the name of the 5th largest city in New Jersey to include the phrase "like the inventor"
#Remove New Mexico and all its cities from the database with one line in the console. You can edit a line in file in app/models too.


Methods
class Team < ActiveRecord::Base
	  belongs_to :city

	  def division_rivals
	  	Team.where(conference: conference,
	  		division: division).where.not(id: id)
	  end
	end

	to call it reload! to add Methods
	had to redefine Patriots was patriots.find(1)

