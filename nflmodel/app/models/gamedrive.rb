class Gamedrive < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  has_many :gamedriveplays

  def self.setup(gameis, teamis, drivehash)
  	gd = Gamedrive.new
	gd.game = gameis
	gd.team = teamis
	gd.qtr = drivehash["qtr"].to_i
	gd.redzone = drivehash["redzone"]
	gd.fds = drivehash["fds"].to_i
	gd.result = drivehash["result"]
	gd.penyds = drivehash["penyds"].to_i
	gd.ydsgained = drivehash["ydsgained"].to_i
	gd.numplays = drivehash["numplays"].to_i
	gd.postime = gd.timeconv(drivehash["postime"])
	gd.starttime = gd.timeelapsed(drivehash["start"]["qtr"].to_i, drivehash["start"]["time"].to_s)
	gd.endtime = gd.timeelapsed(drivehash["end"]["qtr"].to_i, drivehash["end"]["time"].to_s)
	gd.startpos = gd.fieldposition(gd.team.abbr, drivehash["start"]["yrdln"])
	gd.endpos = gd.fieldposition(gd.team.abbr, drivehash["end"]["yrdln"])
  	gd.save
 	return gd
  end

end
