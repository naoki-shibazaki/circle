class ContactMailer < ApplicationMailer

  def send_contact(user, user_contact)
    @user = user
    @user_contact = user_contact
    mail to:      user.admin_user.email,
        reply_to: user_contact.mail,
        subject: "【サークルブック】『#{user_contact.name}』さんから#{user_contact.entry}応募が届きました！"
  end

  def send_member(user, user_contact)
    @user = user
    @user_contact = user_contact
    mail to:      user_contact.mail,
        reply_to: user.admin_user.email,
        subject: "【サークルブック】『#{user.name}』へのお問い合わせありがとうございます！"
  end

end