class OpinionMailer < ApplicationMailer

  def send_violation(user, user_contact)
    @user = user
    @user_contact = @user_contact
    mail to:      "circlebook.mailer@gmail.com",
          reply_to: user.admin_user.email,
          subject: '【サークルブック】規約違反の報告が届きました'
  end

end