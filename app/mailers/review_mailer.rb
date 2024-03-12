class ReviewMailer < ApplicationMailer

  def send_review(user)
    @user = user
    mail to:      user.admin_user.email,
        subject: '【サークルブック】高評価の口コミが投稿されました！'
  end

  def bad_review(user)
    @user = user
    mail to:      "noreply@circle-book.com",
        subject: '【サークルブック】低評価の口コミが投稿されました！'
  end

end
