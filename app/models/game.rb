class Game < ActiveRecord::Base
	has_many :teams
	belongs_to :home_team, class_name: "Team" 
	belongs_to :away_team, class_name: "Team" 
	after_create :update_coach_win_loss

	def final_score
		if home_score
			"#{home_score}-#{away_score}"
		else
			nil
		end
  end
#add the following for coach wins and losses. Incude line 5 as well.
  def update_coach_win_loss
  	#this should make the coach of the winning team hae one more win
  	#and the coach of the losing team have one more loss
    winning_coach.update_attribute :wins, winning_coach.wins + 1
    losing_coach.update_attribute :losses, losing_coach.losses + 1
  end

  def winning_coach
  	#what does it mean to be a winning coach?
  	#all the game knows about is the home team and away team
  	winning_team.coach
  end

  def losing_coach
  	# if not the coach of the winning team then losing coach
  	# there are three type of teams - home, away, winning
  	#if the home is the winning team, away_team.coach
  	#if the home is not the winning team, home_team.coach
  	if home_team == winning_team
  		away_team.coach
  	else 
  		home_team.coach
  	end
  end

  def winning_team
		#what does it mean to be a winning team?
  	#all the game knows about is the home team and away team
  	if home_score > away_score
  		home_team
  	else
  		away_team
  	end
  end
end