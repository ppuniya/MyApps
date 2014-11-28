class Puntingplayerstat < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  belongs_to :player

  def self.setup(gameis, teamis, playerid, punthash)
  	ps = Puntingplayerstat.new
	ps.game = gameis
	ps.team = teamis
	
	ps.player = Player.setup(playerid, punthash["name"].to_s, teamis)
	
	ps.pts = punthash["pts"].to_i
	ps.yds = punthash["yds"].to_i
	ps.avg = punthash["avg"].to_i
	ps.i20 = punthash["i20"].to_i
	ps.lng = punthash["lng"].to_i
  	ps.save
  end
end
