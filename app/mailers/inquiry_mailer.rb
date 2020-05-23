class InquiryMailer < ApplicationMailer
  def admin_reply(user,inquiry) #メソッドに対して引数を設定
    @user = user
    @inquiry = inquiry
    mail to: @user.email, subject: '【くわしめとりっぷ】 お問い合わせありがとうございます'
  end

  def admin_replied(user,inquiry)
    @user = user
    @inquiry = inquiry
    mail to: @user.email, subject: '【くわしめとりっぷ】 お問い合わせの件について'
  end
end
