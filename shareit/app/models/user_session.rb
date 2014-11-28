class UserSession
	def initialize(session)
		@session = session
	end

	def current_user
		@current_user ||= User.find(@session[:user_id]) if @session[:user_id]
	end

	def set_userid(user)
		@session[:user_id] ||= user.id if user
	end

	def destroy
		@session[:user_id] = nil
	end
end
