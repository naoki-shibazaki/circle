class ContactMailer < ApplicationMailer

  def send_contact(user, user_contact)
    @user = user
    @user_contact = user_contact
    mail to:      user.admin_user.email,
        reply_to: user_contact.mail,
        subject: "【サークルブック】#{user_contact.entry}の応募が届きました！"
  end

  def send_member(user, user_contact)
    @user = user
    @user_contact = user_contact
    mail to:      user_contact.mail,
        subject: "【サークルブック】#{user_contact.entry}のお問い合わせありがとうございます！"
  end

end