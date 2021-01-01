class ContactMailer < ApplicationMailer

  def send_contact(user, user_contact)
    @user = user
    @user_contact = user_contact
    mail to:      user.admin_user.email,
	     reply_to: user_contact.mail,
         subject: "【サークルブック】お問い合わせが届きました！"
  end

end
