class BoardlistsController < ApplicationController
	before_filter :authorize

	def create
		bp = boardlist_params
		user = User.find(params[:memberid])
		board = user.pendingboard
		position = board.boardlists.count + 1
		list = List.find(params[:list_id])
		@boardlist = Boardlist.new(:perms=>bp[:perms], :listposition=>position, :board=>board, :list=>list)
		@boardlist.save
		respond_to do |format|
			format.js {}
		end
	end

	def accept
			boardlist = Boardlist.find(params[:id])
			if boardlist.board.user == current_user
				priorityboard = current_user.priorityboard
				boardlist.board = priorityboard
				boardlist.save
				@list = boardlist.list
			else
				redirect_to root_url, :notice=>"Unable to accept this list"
			end
	end

	def reject
		boardlist = Boardlist.find(params[:id])
		if boardlist.board.user == current_user
			inactiveboard = current_user.inactiveboard
			boardlist.board = inactiveboard
			boardlist.save
			@list = boardlist.list
		else
			redirect_to root_url, :notice=>"Unable to reject this list"
		end
	end

	def sort
		params[:boardlist].each_with_index do |id, index|
			bl = Boardlist.find(id)
			bl.listposition = index+1
			bl.save
		end
		render nothing: true
	end

	def edit
		@list = List.find(params[:id])
		@board = Boardlist.findBoard(current_user, @list)
		@reqtype = "update"
		if @board.boardtype != "pending"
			if @list.adminusers.include?(current_user)
				respond_to do |format|
					format.js {}
				end
			else
				redirect_to root_url :notice=>"You do not have sufficient permissions"
			end
		else
			redirect_to root_url :notice=>"Please accept this shared list before edit"
		end
	end

	def update
		bl = Boardlist.find(params[:id])
		if bl.list.adminusers.include?(current_user) 
			if (bl.perms == "admin")
				bl.perms = "member"
			else
				bl.perms = "admin"
			end
			bl.save
			respond_to do |format|
				format.js {}
			end
		else
			redirect_to root_url :notice=>"You do not have sufficient permissions"
		end
	end

	def destroy
		bl = Boardlist.find(params[:id])
		if (bl.board.user == current_user) || (bl.list.adminusers.include?(current_user))
			bl.destroy
			respond_to do |format|
				format.js {}
			end
	 	else
	 		redirect_to root_url :notice=>"You do not have sufficient permissions"
	 	end
	end

	 private
	 	def boardlist_params
			params.require(:boardlist).permit(:perms)
		end
end
