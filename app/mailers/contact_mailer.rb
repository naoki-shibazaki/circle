class ContactMailer < ApplicationMailer

  def send_contact(user, user_contact)
    @user = user
    @user_contact = user_contact
    mail to:      user.admin_user.email,
        reply_to: user_contact.mail,
        subject: "【サークルブック】新規のお問い合わせが届きました！"
  end

  def send_member(user, user_contact)
    @user = user
    @user_contact = user_contact
    mail to:      user_contact.mail,
        subject: "【サークルブック】お問い合わせありがとうございます！"
  end

end