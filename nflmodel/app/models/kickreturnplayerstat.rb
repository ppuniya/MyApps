class Kickreturnplayerstat < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  belongs_to :player

  def self.setup(gameis, teamis, playerid, kickrethash)
  	krs = Kickreturnplayerstat.new
	krs.game = gameis
	krs.team = teamis
	
	krs.player = Player.setup(playerid, kickrethash["name"].to_s, teamis)
	
	krs.ret = kickrethash["ret"].to_i
	krs.avg = kickrethash["avg"].to_i
	krs.tds = kickrethash["tds"].to_i
	krs.lng = kickrethash["lng"].to_i
	krs.lngtd = kickrethash["lngtd"].to_i
	krs.save
  end
end
