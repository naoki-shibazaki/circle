class OpinionMailer < ApplicationMailer

  def send_when_create(user)
    @user = user
    mail to:      user.admin_user.email,
         subject: '【サークルブック】ご意見箱に投稿がありました！'
  end

end