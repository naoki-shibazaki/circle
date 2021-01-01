class ContactMailer < ApplicationMailer

  def send_contact(user)
    @user = user
    mail to:      user.admin_user.email,
	     reply_to: "circlebook.mailer@gmail.com",
         subject: "【サークルブック】お問い合わせが届きました！"
  end

end
