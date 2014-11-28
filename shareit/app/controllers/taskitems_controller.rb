class TaskitemsController < ApplicationController
	before_filter :authorize

	def new
		@taskitem = Taskitem.new
		@list = List.find(params[:id])
		respond_to do |format|
			format.js {}
		end
	end
	
	def create
			tp = taskitem_params
			@list = List.find(params[:list_id])
			if @list.adminusers.include?(current_user)
				duedate = Time.new(tp["duedate(1i)"].to_i, tp["duedate(2i)"].to_i, tp["duedate(3i)"].to_i, tp["duedate(4i)"].to_i, tp["duedate(5i)"].to_i)
				@taskitem = Taskitem.create(:title=>tp[:title], :description=>tp[:description], :duedate=>duedate, :list=>@list)
				respond_to do |format|
					format.js {}
				end
			else
				redirect_to root_url, :notice=>"You do not have sufficient permissions"
			end
	end

	def edit_listitems
		@list = List.find(params[:id])
		if @list.adminusers.include?(current_user)
			@taskitem = Taskitem.new
			respond_to do |format|
				format.js {}
			end
		else
			redirect_to root_url, :notice=>"You do not have sufficient permissions"
		end
	end

	def edit
		@taskitem = Taskitem.find(params[:id])
		respond_to do |format|
			format.js {}
		end
	end

	def update
		tp = taskitem_param
		@taskitem = Taskitem.find(tp[:id])
		@list = @taskitem.list
		if @list.adminusers.include?(current_user)
			@taskitem.update_attributes(tp)
			@taskitem.save
			@taskitems = @list.taskitems
			respond_to do |format|
				format.js {}
			end
		else
			redirect_to root_url, :notice=>"You do not have sufficient permissions"
		end
	end

	def destroy
		@taskitem = Taskitem.find(params[:id])
		@list = @taskitem.list
		if @list.adminusers.include?(current_user)
			@taskitem.destroy
			@taskitems = @list.taskitems
			respond_to do |format|
				format.js {}
			end
		else
			redirect_to root_url, :notice=>"You do not have sufficient permissions"
		end
	end

	def volunteer
			@board = current_user.priorityboard
			@taskitem = Taskitem.find(params[:id])
			@taskitem.board = @board
			@taskitem.save
			@list = @taskitem.list
			@taskitems = @list.taskitems
			respond_to do |format|
				format.js {}
			end
	end

	private
		def taskitem_params
			params.require(:taskitem).permit(:title, :description, :duedate)
		end

		def taskitem_param
			params.require(:taskitem).permit(:id, :title, :description, :duedate)
		end
		
end
