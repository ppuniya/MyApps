class Receivingplayerstat < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  belongs_to :player

  def self.setup(gameis, teamis, playerid, rechash)
  	rs = Receivingplayerstat.new
	rs.game = gameis
	rs.team = teamis
	
	rs.player = Player.setup(playerid, rechash["name"].to_s, teamis)

	rs.rec = rechash["rec"].to_i
	rs.yds = rechash["yds"].to_i
	rs.tds = rechash["tds"].to_i
	rs.lng = rechash["lng"].to_i
	rs.lngtd = rechash["lngtd"].to_i
	rs.twopta = rechash["twopta"].to_i
	rs.twoptm = rechash["twoptm"].to_i
  	rs.save
  end
end
