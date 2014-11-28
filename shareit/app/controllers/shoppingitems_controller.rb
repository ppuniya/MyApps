class ShoppingitemsController < ApplicationController
	before_filter :authorize

	def new
		@shoppingitem = Shoppingitem.new
		@list = List.find(params[:id])
		respond_to do |format|
			format.js {}
		end
	end

	def create
			sp = shopitem_params
			@list = List.find(params[:list_id])
			if @list.adminusers.include?(current_user)
				@shoppingitem = Shoppingitem.create(:name=>sp[:name], :details=>sp[:details], :quantity=>sp[:quantity], :unitcost=>sp[:unitcost], :unittype=>sp[:unittype], :list=>@list)
				ItemsWorker.perform_async(@shoppingitem.id)
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
			@shoppingitem = Shoppingitem.new
			respond_to do |format|
				format.js {}
			end
		else
			redirect_to root_url, :notice=>"You do not have sufficient permissions"
		end
	end

	def edit
		@shoppingitem = Shoppingitem.find(params[:id])
		respond_to do |format|
			format.js {}
		end
	end

	def update
		sp = shopitem_param
		@shoppingitem = Shoppingitem.find(sp[:id])
		@list = @shoppingitem.list
		if @list.adminusers.include?(current_user)
			@shoppingitem.update_attributes(sp)
			@shoppingitem.save
			@shoppingitems = @list.shoppingitems
			respond_to do |format|
				format.js {}
			end
		else
			redirect_to root_url, :notice=>"You do not have sufficient permissions"
		end
	end

	def destroy
		@shoppingitem = Shoppingitem.find(params[:id])
		@list = @shoppingitem.list
		if @list.adminusers.include?(current_user)
			@shoppingitem.destroy
			@shoppingitems = @list.shoppingitems
			respond_to do |format|
				format.js {}
			end
		else
			redirect_to root_url, :notice=>"You do not have sufficient permissions"
		end
	end

	private
		def shopitem_params
			params.require(:shoppingitem).permit(:name, :details, :quantity, :unitcost, :unittype)
		end
		def shopitem_param
			params.require(:shoppingitem).permit(:id, :name, :details, :quantity, :unitcost, :unittype)
		end
end
