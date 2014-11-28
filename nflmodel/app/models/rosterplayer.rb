class Rosterplayer < ActiveRecord::Base
  belongs_to :team
  belongs_to :player


  def self.setup(pid, pname, pteam)
  	nms = pname.split('.').map(&:strip)
	lnm = nms[1]
  	rpl = Rosterplayer.find_by(lname: lnm, team: pteam)
  	if !rpl.nil?
		 if rpl.finitial == nms[0]
		 	if rpl.status != "RET"
				rpl.player = Player.find_by(playerid: pid)
		 		rpl.save
		 	end
		 end
	end
  end

  def self.fromroster(tabbr, fnm, lnm, jrs, ps, st, ht, wt, bd, xp, clg)
  	bdy = Date.strptime(bd.to_s, '%m/%d/%Y')
  	rpl = Rosterplayer.find_by(fname: fnm, lname: lnm, bday: bdy, college: clg)
	tm = Team.find_by(abbr:tabbr)
  	if rpl.nil?
		rpl = Rosterplayer.new
	end
	rpl.fname = fnm
	rpl.lname = lnm
	rpl.jersey = jrs.to_i
	rpl.pos = ps
	rpl.status = st
	rpl.hgt = ht
	rpl.wgt = wt.to_i
	rpl.bday = bdy
	rpl.exp = xp.to_i
	rpl.college = clg
	rpl.team = tm
	rpl.save
  end

  def name
  	p = Rosterplayer.find(self)
	return p.fname[0] + "." + p.lname
  end

  def finitial
  	p = Rosterplayer.find(self)
  	return p.fname[0].to_s
  end
end
