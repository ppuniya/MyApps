class BoardsController < ApplicationController

  def index
  	if current_user
		@user = current_user
		@pendingboard = @user.pendingboard
		@priorityboard = @user.priorityboard
		@inactiveboard = @user.inactiveboard
	else
		redirect_to root_url
	end
  end

end
