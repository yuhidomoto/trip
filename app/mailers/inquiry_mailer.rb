class InquiryMailer < ApplicationMailer
  def admin_reply(admin,inquiry) #メソッドに対して引数を設定
    @admin = admin
    @inquiry = inquiry
    mail to: @admin.email, subject: '【くわしめとりっぷ】 お問い合わせありがとうございます'
  end

  def admin_replied(admin,inquiry)
    @@admin = admin
    @inquiry = inquiry
    mail to: @admin.email, subject: '【くわしめとりっぷ】 お問い合わせの件について'
  end
end
