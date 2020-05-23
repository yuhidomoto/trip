class Users::InquiriesController < ApplicationController
  def new
  	@inquiry = Inquiry.new
  end

  def create
  	@inquiry = Inquiry.new(inquiry_params)
  	@inquiry.user_id = current_user.id
    @user = current_user

  	if @inquiry.save(inquiry_params)
       InquiryMailer.admin_reply(@user,@inquiry).deliver #確認メールを送信
  	   redirect_to mytrips_path
  	else
  	   render "new"
  	end
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:user_id, :title, :body)
  end
end
