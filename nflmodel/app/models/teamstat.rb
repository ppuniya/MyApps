class Teamstat < ActiveRecord::Base
  belongs_to :game
  belongs_to :team

  def self.setup(teamtypeis, gameis, teamhash)
  	t = Teamstat.new
	teamis = Team.find_by(abbr: teamhash["abbr"])
	t.team = teamis
	t.teamtype = teamtypeis
	t.game = gameis
	t.to = teamhash["to"].to_i
	teamscore = teamhash["score"]
	teamother = teamhash["stats"]["team"]
	t.q1 = teamscore["1"]
	t.q2 = teamscore["2"]
	t.q3 = teamscore["3"]
	t.q4 = teamscore["4"]
	t.q5 = teamscore["5"]
	t.total = teamscore["T"]

	t.totfd = teamother["totfd"].to_i
	t.totyds = teamother["totyds"].to_i
	t.pyds = teamother["pyds"].to_i
	t.ryds = teamother["ryds"].to_i
	t.pen = teamother["pen"].to_i
	t.penyds = teamother["penyds"].to_i
	t.trnovr = teamother["trnovr"].to_i
	t.pt = teamother["pt"].to_i
	t.ptyds = teamother["ptyds"].to_i
	t.ptavg = teamother["ptavg"].to_i
	t.top = t.timeconv(teamother["top"].to_s)

	t.save
	return t
  end
end
