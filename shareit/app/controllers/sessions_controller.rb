class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user
		user_session.set_userid(user)
		redirect_to root_url :notice => "Logged in as #{user.fname}!"
	else
		flash.now.alert = "Invalid email or password"
		render "new"
	end
  end

  def destroy
	user_session.destroy
	redirect_to root_url, :notice => "Logged out!"
  end
end
