class NflWorker
	include Sidekiq::Worker
	sidekiq_options retry: false
	
	def perform(start_date, end_date)
		
		require 'httparty'
		require 'json'
		require 'open-uri'
		
		gamedow = ["1", "2", "3", "4", "5", "6", "7"]
		gamemonths = ["08", "09", "10", "11", "12", "01", "02", "03"]
		premonths = ["07", "08", "09"]
		stDate = Date.strptime(start_date.to_s, '%d-%m-%Y')
		endDate = Date.strptime(end_date.to_s, '%d-%m-%Y')

		
		stDate.upto(endDate) { |date|
			if (gamedow.include? date.strftime('%u'))
				puts "---Game Day #{date.strftime('%u')}----"
				if (gamemonths.include? date.strftime('%m'))
					 responsestatus = 2
					 (0..16).each { |i|
						 game_id = ""
						 if i < 10
							 game_id = (date.strftime('%Y%m%d') + '0' + i.to_s)
						 else
							 game_id = (date.strftime('%Y%m%d') + i.to_s)
						 end
						 response = HTTParty.get("http://www.nfl.com/liveupdate/game-center/#{CGI.escape(game_id)}/#{CGI.escape(game_id)}_gtd.json")
						 case response.code
							 when 200
								 responsestatus = 2
								 puts "Success for game id : #{game_id}"
								 if !response.empty?
									 storegame("season", response)
								 else
									 puts "But empty game"
								 end
							 when 404
								 responsestatus = responsestatus - 1
								 puts "Game not found : #{game_id}"
							 when 500-600
								 responsestatus = responsestatus - 1
								 puts "ZOMG Error #{response.code}"
						 end
						 break if responsestatus < 0
					 }
				end
				if (premonths.include? date.strftime('%m'))
					 responsestatus = 2
					 (50..66).each { |i|
						 game_id = (date.strftime('%Y%m%d') + i.to_s)
						 response = HTTParty.get("http://www.nfl.com/liveupdate/game-center/#{CGI.escape(game_id)}/#{CGI.escape(game_id)}_gtd.json")
						 case response.code
							 when 200
								 responsestatus = 2
								 puts "Success for game id : #{game_id}"
								 if !response.empty?
									 storegame("preseason", response)
								 else
									 puts "But empty game"
								 end
							 when 404
								 responsestatus = responsestatus - 1
								 puts "Game not found : #{game_id}"
							 when 500-600
								 responsestatus = responsestatus - 1
								 puts "ZOMG Error #{response.code}"
						 end
						 break if responsestatus < 0
					 }
				end
			else
				puts "---It's #{date.strftime('%u')}----"
			end
		}


	end

	def storegame(gametype, response)
		gameid = response.first[0]
		puts gameid
		game = Game.find_by(gameid: gameid)
		if !game.nil?
			puts "Already have it"
			return
		end
		game = Game.setup(gametype, response.first)
		response = response.values.first
		#--------------home stats -----------
		homestats = response["home"]

		hometeamstats = Teamstat.setup("home", game, homestats)
		hometeam = hometeamstats.team
		
		homeindstats = homestats["stats"]
		
		if !homeindstats["passing"].nil?
			 homeindstats["passing"].each do |key, value|
				 Passingplayerstat.setup(game, hometeam, key.to_s, value)
			 end
		end

		if !homeindstats["rushing"].nil?
			 homeindstats["rushing"].each do |key, value|
				 Rushingplayerstat.setup(game, hometeam, key.to_s, value)
			 end
		end

		if !homeindstats["receiving"].nil?
			 homeindstats["receiving"].each do |key, value|
				 Receivingplayerstat.setup(game, hometeam, key.to_s, value)
			 end
		end
		
		if !homeindstats["fumbles"].nil?
			homeindstats["fumbles"].each do |key, value|
				Fumblesplayerstat.setup(game, hometeam, key.to_s, value)
			end
		end
	
		if !homeindstats["kicking"].nil?
			 homeindstats["kicking"].each do |key, value|
				 Kickingplayerstat.setup(game, hometeam, key.to_s, value)
			 end
		end
	
		if !homeindstats["punting"].nil?
			 homeindstats["punting"].each do |key, value|
				 Puntingplayerstat.setup(game, hometeam, key.to_s, value)
			 end
		end
	
		if !homeindstats["kickret"].nil?
			 homeindstats["kickret"].each do |key, value|
				 Kickreturnplayerstat.setup(game, hometeam, key.to_s, value)
			 end
		end

		if !homeindstats["puntret"].nil?
			 homeindstats["puntret"].each do |key, value|
				 Puntreturnplayerstat.setup(game, hometeam, key.to_s, value)
			 end
		end

		if !homeindstats["defense"].nil?
			 homeindstats["defense"].each do |key, value|
				 Defenseplayerstat.setup(game, hometeam, key.to_s, value)
			 end
		end


		#HomeWorker.perform_async(game.id, hometeamstats.team.id, homeindstats)
		
		#--------------away stats -----------
		awaystats = response["away"]

		awayteamstats = Teamstat.setup("away", game, awaystats)
		awayteam = awayteamstats.team

		awayindstats = awaystats["stats"]

		if !awayindstats["passing"].nil?
			 awayindstats["passing"].each do |key, value|
				 Passingplayerstat.setup(game, awayteam, key.to_s, value)
			 end
		end


		if !awayindstats["rushing"].nil?
			 awayindstats["rushing"].each do |key, value|
				 Rushingplayerstat.setup(game, awayteam, key.to_s, value)
			 end
		end

		if !awayindstats["receiving"].nil?
			 awayindstats["receiving"].each do |key, value|
				 Receivingplayerstat.setup(game, awayteam, key.to_s, value)
			 end
		end
		
		if !awayindstats["fumbles"].nil?
			awayindstats["fumbles"].each do |key, value|
				Fumblesplayerstat.setup(game, awayteam, key.to_s, value)
			end
		end
	
		if !awayindstats["kicking"].nil?
			 awayindstats["kicking"].each do |key, value|
				 Kickingplayerstat.setup(game, awayteam, key.to_s, value)
			 end
		end
	
		if !awayindstats["punting"].nil?
			 awayindstats["punting"].each do |key, value|
				 Puntingplayerstat.setup(game, awayteam, key.to_s, value)
			 end
		end
	
		if !awayindstats["kickret"].nil?
			 awayindstats["kickret"].each do |key, value|
				 Kickreturnplayerstat.setup(game, awayteam, key.to_s, value)
			 end
		end

		if !awayindstats["puntret"].nil?
			 awayindstats["puntret"].each do |key, value|
				 Puntreturnplayerstat.setup(game, awayteam, key.to_s, value)
			 end
		end

		if !awayindstats["defense"].nil?
			 awayindstats["defense"].each do |key, value|
				 Defenseplayerstat.setup(game, awayteam, key.to_s, value)
			 end
		end
		#AwayWorker.perform_async(game.id, awayteamstats.team.id, awayindstats)
	
	 	#----------------------Drives and plays-----------------------------
		
		drivehash = response["drives"]

		if !drivehash.nil?
			 drivehash.each do |key, value|
				 if key != "crntdrv"
					 if (value["posteam"] == hometeam.abbr)
						 gdrive = Gamedrive.setup(game, hometeam, value)
					 else
						 gdrive = Gamedrive.setup(game, awayteam, value)
					 end
					 playvalues = value["plays"]
					 if !playvalues.nil?
						  playvalues.each do |pkey, pval|
							  gdplay = Gamedriveplay.setup(gdrive, pval)

							  playershash = pval["players"]
							  
							  if !playershash.nil?
								   playershash.each do |plkey, plvals|
								   	   plvals.each do |plval|
									   		Playerdriveplay.setup(plkey.to_s, gdplay, plval)
								   	   end
								   end
							  end
						  end
					 end
				 end
			 end
		end
		
		#DriveWorker.perform_async(game.id, hometeamstats.team.id, awayteamstats.team.id, drivehash)



		#---------------------Score Summaries------------------------------------
		
		scrsumhash = response["scrsummary"]

		if !scrsumhash.nil?
			 scrsumhash.each do |key, value|
				 Gamescoresummary.setup(game, value)
			 end
		end
		#ScoreWorker.perform_async(game.id, scrsumhash)


	end

end
