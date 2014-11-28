class Puntreturnplayerstat < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  belongs_to :player

  def self.setup(gameis, teamis, playerid, puntrethash)
  	ps = Puntreturnplayerstat.new
	ps.game = gameis
	ps.team = teamis
	
	ps.player = Player.setup(playerid, puntrethash["name"].to_s, teamis)
	
	ps.ret = puntrethash["ret"].to_i
	ps.avg = puntrethash["avg"].to_i
	ps.tds = puntrethash["tds"].to_i
	ps.lng = puntrethash["lng"].to_i
	ps.lngtd = puntrethash["lngtd"].to_i
	ps.save
  end
end
