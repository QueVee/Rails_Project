class State < ActiveRecord::Base
  has_many :cities
  #has_many :teams, through: :cities

end