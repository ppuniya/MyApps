class Defenseplayerstat < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  belongs_to :player

  def self.setup(gameis, teamis, playerid, defhash)
  	ds = Defenseplayerstat.new
	ds.game = gameis
	ds.team = teamis
	
	ds.player = Player.setup(playerid, defhash["name"].to_s, teamis)
	
	ds.tkl = defhash["tkl"].to_i
	ds.ast = defhash["ast"].to_i
	ds.sk = defhash["sk"].to_i
	ds.int = defhash["int"].to_i
	ds.ffum = defhash["ffum"].to_i
	ds.save
  end
end
