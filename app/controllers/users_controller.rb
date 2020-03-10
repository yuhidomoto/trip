class UsersController < ApplicationController
	def index
	end

	def show
		@user = User.find(params[:id])
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
  		redirect_to user_path(@user), notice: "successfully updated user!"
  	 else
  		render "edit"
  	 end
	end

	def destroy
	end

	def withdraw
		set_user
		if @user != current_user
			redirect_to mytrips_path
		end
	end

	private
  def user_params
    params.require(:user).permit(:name, :gender, :age, :email)
  end

end
