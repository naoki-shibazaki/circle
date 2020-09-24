class UserMailer < ApplicationMailer

  def send_when_create(user)
    @user = user
    mail to:      "circlebook.mailer@gmail.com",
         subject: '【サークルブック】新しい質問が届きました！'
  end
  
end
