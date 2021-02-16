class UserMailer < ApplicationMailer

  def send_when_create(user)
    @user = user
    mail to:      user.admin_user.email,
          subject: '【サークルブック】新しい質問が届きました！'
  end

end
