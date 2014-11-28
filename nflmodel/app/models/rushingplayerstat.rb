class Rushingplayerstat < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  belongs_to :player

  def self.setup(gameis, teamis, playerid, rushhash)
  	rs = Rushingplayerstat.new
	rs.game = gameis
	rs.team = teamis
	
	rs.player = Player.setup(playerid, rushhash["name"].to_s, teamis)
	
	rs.att = rushhash["att"].to_i
	rs.yds = rushhash["yds"].to_i
	rs.tds = rushhash["tds"].to_i
	rs.lng = rushhash["lng"].to_i
	rs.lngtd = rushhash["lngtd"].to_i
	rs.twopta = rushhash["twopta"].to_i
	rs.twoptm = rushhash["twoptm"].to_i
	rs.save
  end
end
