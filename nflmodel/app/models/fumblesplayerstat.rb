class Fumblesplayerstat < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  belongs_to :player
  
  
  def self.setup(gameis, teamis, playerid, fumhash)
  	fs = Fumblesplayerstat.new
	fs.game = gameis
	fs.team = teamis

	fs.player = Player.setup(playerid, fumhash["name"].to_s, teamis)

	fs.tot = fumhash["tot"].to_i
	fs.rcv = fumhash["rcv"].to_i
	fs.trcv = fumhash["trcv"].to_i
	fs.yds = fumhash["yds"].to_i
	fs.lost = fumhash["lost"].to_i
	fs.save
  end
end
