class Kickingplayerstat < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  belongs_to :player

  def self.setup(gameis, teamis, playerid, kickhash)
  	ks = Kickingplayerstat.new
	ks.game = gameis
	ks.team = teamis
	
	ks.player = Player.setup(playerid, kickhash["name"].to_s, teamis)
	
	ks.fgm = kickhash["fgm"].to_i
	ks.fga = kickhash["fga"].to_i
	ks.fgyds = kickhash["fgyds"].to_i
	ks.totpfg = kickhash["totpfg"].to_i
	ks.xpmade = kickhash["xpmade"].to_i
	ks.xpmissed = kickhash["xpmissed"].to_i
	ks.xpa = kickhash["xpa"].to_i
	ks.xpb = kickhash["xpb"].to_i
	ks.xptot = kickhash["xptot"].to_i
  	ks.save
  end
end
