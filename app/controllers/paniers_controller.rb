class PaniersController < ApplicationController
	def create
		@item = Item.find(params[:item_id])
   		@user = current_user
    	@quantity = params[:quantity]

	    @quantity.to_i.times do
    	  @add = Panier.create(user: @user, item: @item)
    	end

    if @add.save
      flash[:success] = "Bien ajouté au panier"
      redirect_to root_path
    else
      flash[:error] = "Une erreur est survenue"
      redirect_to root_path
    end
	end	

	def index
		if user_signed_in?
		@user = current_user
		@cart = @user.items.to_a
	else	
		redirect_to root_path
	end
	end	

	def edit
		@user = current_user
		@item = @user.items[params[:id]]
		@item.destroy
		redirect_to root_path
	end	
end
