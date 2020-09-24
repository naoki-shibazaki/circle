class OpinionMailer < ApplicationMailer

  def send_opinion(opinion)
    @opinion = opinion
    mail to:      "circlebook47@gmail.com",
         subject: '【サークルブック】ご意見箱に投稿がありました！'
  end

end