class ListsController < ApplicationController
  before_filter :authorize

  def new
  	@list = List.new
	@board = current_user.priorityboard
  	@inputView = "list"
  end

  def create
		@list = List.create(list_params)
		@board = current_user.priorityboard
		position = @board.boardlists.count + 1
		@boardlist = @list.boardlists.build(:perms=>"admin", :board=>@board, :listposition=>position)
		@boardlist.save
		@reqtype = "create"
		respond_to do |format|
			format.js {}
  		end
  end

  def show
		@list = List.find(params[:id])
		bls = @list.boardlists.select {|bl| bl.board.user == current_user}
		@boardlist = bls.first
		if @list.allusers.include?(current_user)
			render 'show'
		else
			redirect_to root_url, :notice=>"You do not have permission to view this list"
		end
  end

  def destroy
  		@list= List.find(params[:id])
		if @list.adminusers.include?(current_user)
			@list.destroy
  			redirect_to root_url, :notice=>"List Deleted"
 		else
			redirect_to root_url, :notice=>"You do not have permissions to delete this list"
		end
  end

  def edit
		@list = List.find(params[:id])
		if @list.adminusers.include?(current_user)
			render 'edit'
		else
			redirect_to root_url, :notice=>"You do not have permission to modify this list"
		end
  end

  def update
  	lp = list_param
	@list = List.find(lp[:id])
	@board = Boardlist.findBoard(current_user, @list)
	if !@board.nil?
		if @list.adminusers.include?(current_user)
			@list.update_attributes(lp)
			@reqtype = "update"
			respond_to do |format|
				format.js {}
			end
		else
			redirect_to root_url, :notice=>"You do not have permission to modify this list"
		end
	else
		redirect_to root_url, :notice=>"You do not have permission to modify this list"
	end
  end
  

  private
  	def list_params
		params.require(:list).permit(:listtype, :title, :description)
	end

	def list_param
		params.require(:list).permit(:id, :listtype, :title, :description)
	end

end
