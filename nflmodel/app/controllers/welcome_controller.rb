class WelcomeController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:storegame]

  def index
  end

  def storegame
  	gamestr = params_game[:game_str].to_s
	gamestrn = params_game[:game_strnext].to_s
	NflWorker.perform_async(gamestr, gamestrn)
  end

  def fetchrosters
  	RosterWorker.perform_async
  end

  private
  	def params_game
		params.permit(:game_str, :game_strnext)
	end
end
