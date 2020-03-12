class ItemsController < ApplicationController
	
	def index
		tout = Item.all
		@products = tout.shuffle
	end	

	def show
		@item = Item.find(params[:id])
	end	

end
