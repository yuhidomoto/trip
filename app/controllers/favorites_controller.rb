class FavoritesController < ApplicationController
	 def create
  	@mytrip = Mytrip.find(params[:mytrip_id])
    favorite = current_user.favorites.new(mytrip_id: @mytrip.id)
    favorite.save
  end

  def destroy
    @mytrip = Mytrip.find(params[:mytrip_id])
    favorite = current_user.favorites.find_by(mytrip_id: @mytrip.id)
    favorite.destroy
  end
end
