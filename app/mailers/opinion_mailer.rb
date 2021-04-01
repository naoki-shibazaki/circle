class OpinionMailer < ApplicationMailer

  def send_opinion(opinion, user)
    @opinion = opinion
    @user = user
    mail to:      "circlebook.mailer@gmail.com",
          reply_to: user.admin_user.email,
          subject: '【サークルブック】ご意見箱に投稿がありました！'
  end

end