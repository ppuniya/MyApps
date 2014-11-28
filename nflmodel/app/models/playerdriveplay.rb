class Playerdriveplay < ActiveRecord::Base
  belongs_to :gamedriveplay
  belongs_to :player
  belongs_to :team

  def self.setup(plyrid, gdplay, pldhash)
  	pdp = Playerdriveplay.new
	playeris = nil
	if (plyrid != "0")
		playeris = Player.find_by(playerid: plyrid)
	end
	teamis = Team.find_by(abbr: pldhash["clubcode"])
	pdp.team = teamis
	pdp.player = playeris
	pdp.gamedriveplay = gdplay
	pdp.statid = pldhash["statId"].to_i
	pdp.yards = pldhash["yards"].to_i
	pdp.save
  end
  
  def game
  	pdp = Playerdriveplay.find(self)
	return pdp.gamedriveplay.game
  end
end
