class FriendshipsController < ApplicationController
	before_filter :authorize

	def create
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id], :friendshipstatus => 1)
		if @friendship.save
			flash[:notice] = "Added contact"
			redirect_to root_url
		else
			flash[:notice] = "Unable to add contact"
			redirect_to root_url
		end
	end

	def accept
		fship = Friendship.find(params[:id])
		if fship.friendshipstatus < 2 && fship.friend == current_user
			@friendship = current_user.friendships.build(:friend_id => fship.user.id)
			@friendship.friendshipstatus = 2
			fship.friendshipstatus = 2
			if fship.save && @friendship.save
				flash[:notice] = "Accepted contact request"
				redirect_to root_url
			else
				flash[:notice] = "Unable to accept contact request"
				redirect_to root_url
			end
		else
			redirect_to root_url, :notice=>"Unable to accept contact request"
		end
	end

	def reject
		fship = Friendship.find(params[:id])
		if fship.friendshipstatus < 2 && fship.friend == current_user
			fship.friendshipstatus = 0
			if fship.save
				flash[:notice] = "Rejected contact request"
				redirect_to root_url
			else
				flash[:notice] = "Unable to reject contact request"
				redirect_to root_url
			end
		else
			redirect_to root_url, :notice=>"Unable to manage contact request"
		end
	end

	def destroy
		@friendship = current_user.friendships.find(params[:id])
		if @friendship.friendshipstatus == 2
			fship = current_user.inverse_friendships.find_by(user_id: @friendship.friend_id)
			fship.friendshipstatus = 0
			fship.save
		end
		@friendship.destroy
		flash[:notice] = "Removed contact"
		redirect_to root_url
	end

end
