class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find(params[:id])
		@mytrips = @user.mytrips.page(params[:page]).per(6)
	end

	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
    	redirect_to user_path(current_user)
    end
	end

	def update
	@user = User.find(params[:id])
		if @user.update(user_params)
		redirect_to user_path(@user), notice: "会員情報の変更が完了しました。"
		else
		render "edit"
		end
	end

	def destroy
		user = User.find(params[:id])
  	user.destroy
  	redirect_to root_path
	end

	private
  def user_params
    params.require(:user).permit(:name, :gender, :age, :email)
  end

end
