class Player < ActiveRecord::Base
  has_one :rosterplayer
  has_one :team, :through=>:rosterplayer
  
  has_many :playerdriveplays
  
  has_many :defenseplayerstats
  has_many :kickingplayerstats
  has_many :kickreturnplayersts
  has_many :puntingplayerstats
  has_many :puntreturnplayerstats
  has_many :passingplayerstats
  has_many :rushingplayerstats
  has_many :receivingplayerstats
  has_many :fumblesplayerstats

  def self.setup(plyrid, plyrname, plyrteam)
  	pl = Player.find_by(playerid: plyrid)
	if pl.nil?
		pl = Player.new
		pl.playerid = plyrid
		pl.name = plyrname
		pl.started = DateTime.now
		pl.save
		Rosterplayer.setup(plyrid, plyrname, plyrteam)
	else
		if pl.rosterplayer.nil?
			Rosterplayer.setup(plyrid, plyrname, plyrteam)
		end
	end
	return pl
  end

end
