class Passingplayerstat < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  belongs_to :player

  def self.setup(gameis, teamis, playerid, passstat)
  	ps = Passingplayerstat.new
	ps.game = gameis
	ps.team = teamis
	
	ps.player = Player.setup(playerid, passstat["name"].to_s, teamis)

	ps.att = passstat["att"].to_i
	ps.cmp = passstat["cmp"].to_i
	ps.yds = passstat["yds"].to_i
	ps.tds = passstat["tds"].to_i
	ps.ints = passstat["ints"].to_i
	ps.twopta = passstat["twopta"].to_i
	ps.twoptm = passstat["twoptm"].to_i
	ps.save
  end
end
