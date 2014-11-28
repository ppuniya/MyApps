class Team < ActiveRecord::Base
  has_many :rosterplayers
  has_many :players, :through=>:rosterplayers

  has_many :defenseplayerstats
  has_many :gamedrives
  has_many :gamescoresummaries
  has_many :kickingplayerstats
  has_many :kickreturnplayersts
  has_many :puntingplayerstats
  has_many :puntreturnplayerstats
  has_many :passingplayerstats
  has_many :rushingplayerstats
  has_many :receivingplayerstats
  has_many :fumblesplayerstats
  has_many :playerdriveplays
  has_many :teamstats

  has_many :games, :through=>:teamstats

end
