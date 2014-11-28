class UsersController < ApplicationController
  before_filter :authorize, :only => [:index, :findcontacts]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
	if @user.save
		@pendingboard = @user.boards.build(:title=>"Pending Lists", :description=>"#{@user.fullname}'s pending lists", :boardtype=>"pending")
		@priorityboard = @user.boards.build(:title=>"Active Lists", :description=>"#{@user.fullname}'s active lists", :boardtype=>"priority")
		@inactiveboard = @user.boards.build(:title=>"Inactive Lists", :description=>"#{@user.fullname}'s inactive lists", :boardtype=>"inactive")
		@pendingboard.save
		@priorityboard.save
		@inactiveboard.save
		@user.save
		redirect_to root_url, :notice => "Signed up!"
	else
		render "new"
	end
  end

  def index
	@user = current_user
	@friendrequests = Friendship.where(friend_id: current_user.id).collect { |f| f if f.friendshipstatus == 1}
	@friendrequests = @friendrequests.select {|f| !f.nil?}
	render "index"
  end
  
  def findcontacts
	@users = User.all.collect {|u| u if (u != current_user) && !current_user.friends.include?(u)}
	@users = @users.select {|u| !u.nil?}
	@friendships = current_user.friendships
	@friendrequests = Friendship.where(friend_id: current_user.id).collect { |f| f if f.friendshipstatus == 1}
	@friendrequests = @friendrequests.select {|f| !f.nil?}
	render "findcontacts"
  end

  private
  	def user_params
		params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
	end

end
