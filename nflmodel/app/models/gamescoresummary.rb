class Gamescoresummary < ActiveRecord::Base
  belongs_to :game
  belongs_to :team

  def self.setup(gameis, gsshash)
  	gss = Gamescoresummary.new
	gss.game = gameis
	teamis = Team.find_by(abbr: gsshash["team"])
	gss.team = teamis
	gss.scoretype = gsshash["type"]
	gss.desc = gsshash["desc"]
	gss.qtr = gsshash["qtr"].to_i
  	gss.save
  end
end
