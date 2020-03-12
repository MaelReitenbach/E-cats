class UsersController < ApplicationController
	def index
		@user = current_user
		@cart = @user.items
		@cart.destroy_all

		redirect_to root_path
	end	
end
