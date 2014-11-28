class RosterWorker
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform
		#------------set up all params for getting data-------------#

		teamarr = Team.all.collect {|t| t.abbr}
		teamsite = Hash.new
		teamadd = Hash.new
		teammainobj = Hash.new
		teamiterobj = Hash.new
		teamjersey = Hash.new
		teamname = Hash.new
		teampos = Hash.new
		teamstatus = Hash.new
		teamhgt = Hash.new
		teamwgt = Hash.new
		teambday = Hash.new
		teamexp = Hash.new
		teamcollege = Hash.new
		Team.all.each do |t|
			teamsite[t.abbr] = "http://www.nfl.com/teams"
			
			teamadd[t.abbr] = "/#{t.teamname}/roster?team=#{t.abbr}"
		
			teammainobj[t.abbr] = "tbody"

			teamiterobj[t.abbr] = "tr"

			teamjersey[t.abbr] = "td:nth-child(1)"
			teamname[t.abbr] = "td:nth-child(2)"
			teampos[t.abbr] = "td:nth-child(3)"
			teamstatus[t.abbr] = "td:nth-child(4)"
			teamhgt[t.abbr] = "td:nth-child(5)"
			teamwgt[t.abbr] = "td:nth-child(6)"
			teambday[t.abbr] = "td:nth-child(7)"
			teamexp[t.abbr] = "td:nth-child(8)"
			teamcollege[t.abbr] = "td:nth-child(9)"
		end
		
		#------------end of setting up-------------#

		Rosterplayer.all.each do |rp|
			rp.update_attribute(:status, "RET")
		end
		teamarr.each do |t|
			if (t != 'AFC') && (t != 'NFC')
				 puts t
				 fetchroster(t, teamsite[t.to_s], teamadd[t.to_s], teammainobj[t.to_s], teamiterobj[t.to_s], teamjersey[t.to_s], teamname[t.to_s], teampos[t.to_s], teamstatus[t.to_s], teamhgt[t.to_s], teamwgt[t.to_s], teambday[t.to_s], teamexp[t.to_s], teamcollege[t.to_s])
			end
		end
	end
	
	def fetchroster(teamabbr, teamaddr, teamadd, teammainobj, teamiterobj, teamjersey, teamname, teampos, teamstatus, teamhgt, teamwgt, teambday, teamexp, teamcollege)
		require 'nokogiri'
		require 'open-uri'
		puts teamaddr
		url = teamaddr + teamadd
		doc = Nokogiri::HTML(open(url))
		tablebody = doc.at_css(teammainobj.to_s)
		tablebody.css(teamiterobj.to_s).each do |item|
			 jersey = item.at_css(teamjersey.to_s).text.strip
			 name = item.at_css(teamname.to_s).text.strip
			 position = item.at_css(teampos.to_s).text.strip
			 status = item.at_css(teamstatus.to_s).text.strip
			 height = item.at_css(teamhgt.to_s).text.strip
			 weight = item.at_css(teamwgt.to_s).text.strip
			 bday = item.at_css(teambday.to_s).text.strip
			 exp = item.at_css(teamexp.to_s).text.strip
			 college = item.at_css(teamcollege.to_s).text.strip

			 namearr = name.split(',').map(&:strip)
			 fname = namearr[1]
			 lname = namearr[0]

			 Rosterplayer.fromroster(teamabbr, fname, lname, jersey, position, status, height, weight, bday, exp, college)
		end

	end

end
