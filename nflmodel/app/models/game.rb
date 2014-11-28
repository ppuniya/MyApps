class Game < ActiveRecord::Base
  has_many :gamedrives
  has_many :gamescoresummaries
  
  has_many :defenseplayerstats
  has_many :kickingplayerstats
  has_many :kickreturnplayerstats
  has_many :puntingplayerstats
  has_many :puntreturnplayerstats
  has_many :passingplayerstats
  has_many :rushingplayerstats
  has_many :receivingplayerstats
  has_many :fumblesplayerstats
  has_many :teamstats

def self.setup(gametype, gamehash)
	gamestr = gamehash[0]
	game = Game.new
	game.gametype = gametype
	gamedata = gamehash[1]
	game.gameid = gamestr
	game.gamedate = Date.new(gamestr[0..3].to_i, gamestr[4..5].to_i, gamestr[6..7].to_i)
	game.weather = gamedata["weather"]
	game.media = gamedata["media"]
	game.yl = gamedata["yl"]
	game.qtr = gamedata["qtr"]
	game.note = gamedata["note"]
	game.down = gamedata["down"].to_i
	game.togo = gamedata["togo"].to_i
	game.redzone = gamedata["redzone"]
	game.clock = game.timeelapsed("4", gamedata["clock"].to_s)
	game.posteam = gamedata["posteam"]
	game.stadium = gamedata["stadium"]
	game.save
	return game
end

#def gamedrives
#	g = Game.find(self)
#	gds = Gamedrive.all.select {|gd| gd.game.id == g.id}
#	return gds
#end
end
