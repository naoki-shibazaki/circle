# Preview all emails at http://localhost:3000/rails/mailers/opinion_mailer
class OpinionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/opinion_mailer/send_opinion
  def send_opinion
    OpinionMailer.send_opinion
  end

end
