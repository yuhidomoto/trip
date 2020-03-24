class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@users = User.all
	end

	def show
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to admins_users_path, notice: "会員情報の変更が完了しました。"
  	else
		 render "edit"
		end
	end

	def destroy
	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to admins_users_path, notice: "会員を削除しました"
  end

  def user_params
    params.require(:user).permit(:name, :gender, :age, :email)
  end
end
