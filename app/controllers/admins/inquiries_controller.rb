class Admins::InquiriesController < ApplicationController
  def index
    @inquiries = Inquiry.all
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    @user = User.find(params[:id])
  end

  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  def update
    inquiry = Inquiry.find(params[:id]) #inquiry_mailer.rbの引数を指定
    inquiry.update(inquiry_params)
    InquiryMailer.admin_replied(inquiry.user, inquiry).deliver
    redirect_to admins_inquiries_path
  end

  def destroy
    inquiry = Inquiry.find(params[:id])
    inquiry.destroy
    redirect_to admins_inquiries_path
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:user_id, :title, :body, :reply)
  end
end
