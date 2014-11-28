class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :user_session
  helper_method :authorize

  private
  
  	def current_user
		@current_user ||= user_session.current_user
	end
	def user_session
		@user_session ||= UserSession.new(session)
	end

	def authorize
		unless current_user
			redirect_to "/sessions/new", :notice=>"Please log in to start using ShareIt!"
		end
	end

end
