class Gamedriveplay < ActiveRecord::Base
  belongs_to :gamedrive
  has_many :playerdriveplays

  def self.setup(gdrive, gdhash)
  	gdp = Gamedriveplay.new
	gdp.gamedrive = gdrive
	gdp.sp = gdhash["sp"].to_i
	gdp.qtr = gdhash["qtr"].to_i
	gdp.down = gdhash["down"].to_i
  	if gdhash["time"] == ""
		gdp.starttime = gdp.timeelapsed(gdhash["qtr"], "00:00")
		gdp.yrdln = 0
		gdp.ydstogo = 0
		gdp.ydsnet = 0
	else
		gdp.starttime = gdp.timeelapsed(gdhash["qtr"], gdhash["time"])
		gdp.yrdln = gdp.fieldposition(gdhash["posteam"], gdhash["yrdln"])
		gdp.ydstogo = gdhash["ydstogo"].to_i
		gdp.ydsnet = gdhash["ydsnet"].to_i
	end
	gdp.desc = gdhash["desc"]
	gdp.note = gdhash["note"]
	gdp.save
	return gdp
  end

  def game
  	gdp = Gamedriveplay.find(self)
	return gdp.gamedrive.game
  end
end
