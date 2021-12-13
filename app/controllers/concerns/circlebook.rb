module Circlebook
  extend ActiveSupport::Concern

    # サークルブックポイント
    def cb_point(user)
      if user.admin_user.check.present? && user.admin_user.check != 0
        # 違反者
        user.point = -100
      else
        blog_point = user.blogs.count * 0.5
        schedule_point = user.schedules.count * 0.1
        qa_point = Question.where(user_id: user.id).where.not(answer: nil).count * 1
        review_point = Review.where(user_id: user.id, review: 1).count * 3
        user.point = blog_point + schedule_point + qa_point + review_point
      end
    end

end