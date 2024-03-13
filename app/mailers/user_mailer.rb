class UserMailer < ApplicationMailer

  def send_when_create(user, question)
    @user = user
    @question = question
    mail to:      user.admin_user.email,
          subject: "【サークルブック】『#{user.name}』宛に新しい質問が届きました！"
  end

end
