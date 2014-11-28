desc "Destroy all Game data"
task :destroy_game_data => :environment do
	Game.all.each do |g|
		g.destroy
	end
	Player.all.each do |g|
		g.destroy
	end
	Teamstat.all.each do |g|
		g.destroy
	end
	Gamedrive.all.each do |g|
		g.destroy
	end
	Gamedriveplay.all.each do |g|
		g.destroy
	end
	Defenseplayerstat.all.each do |g|
		g.destroy
	end
	Fumblesplayerstat.all.each do |g|
		g.destroy
	end
	Gamescoresummary.all.each do |g|
		g.destroy
	end
	Kickingplayerstat.all.each do |g|
		g.destroy
	end
	Kickreturnplayerstat.all.each do |g|
		g.destroy
	end
	Puntingplayerstat.all.each do |g|
		g.destroy
	end
	Puntreturnplayerstat.all.each do |g|
		g.destroy
	end
	Playerdriveplay.all.each do |g|
		g.destroy
	end
	Passingplayerstat.all.each do |g|
		g.destroy
	end
	Rushingplayerstat.all.each do |g|
		g.destroy
	end
	Receivingplayerstat.all.each do |g|
		g.destroy
	end

end


desc "Destroy particular Game data"
task :destroy_particular_game, [:gameid] => [:environment] do |t, args|
      gameid = args[:gameid]
	  game = Game.find_by(gameid: gameid)
	  puts game.gamedate.strftime('%d-%m-%Y')
	  game.teamstats.each do |gs|
	  	gs.destroy
	  end
	  game.defenseplayerstats.each do |gs|
	  	gs.destroy
	  end
	  game.kickingplayerstats.each do |gs|
	  	gs.destroy
	  end
	  game.kickreturnplayerstats.each do |gs|
	  	gs.destroy
	  end
	  game.puntingplayerstats.each do |gs|
	  	gs.destroy
	  end
	  game.puntreturnplayerstats.each do |gs|
	  	gs.destroy
	  end
	  game.passingplayerstats.each do |gs|
	  	gs.destroy
	  end
	  game.rushingplayerstats.each do |gs|
	  	gs.destroy
	  end
	  game.receivingplayerstats.each do |gs|
	  	gs.destroy
	  end
	  game.fumblesplayerstats.each do |gs|
	  	gs.destroy
	  end
	  game.gamedrives.each do |gd|
	  	gd.gamedriveplays.each do |gdp|
			gdp.playerdriveplays.each do |pdp|
				pdp.destroy
			end
			gdp.destroy
		end
		gd.destroy
	  end
	  game.gamescoresummaries.each do |gs|
	  	gs.destroy
	  end
	  game.destroy
end
