module Circlebook
  extend ActiveSupport::Concern

    # サークルブックポイント
    def cb_point(user)
      if user.admin_user.check.present? && user.admin_user.check != 0
        # 違反者
        user.cb_point = -100
      else
        @schedule_point = user.schedules.count * 0.1
        @blog_point = user.blogs.count * 0.2
        @qa_point = Question.where(user_id: user.id).where.not(answer: nil).count * 1
        @review_point = Review.where(user_id: user.id, review: 1).count * 3
        @respond_point = UserContact.where(user_id: user.id, respond_check: "NG").count * 10
        user.cb_point = @blog_point + @schedule_point + @qa_point + @review_point - @respond_point
      end
    end

    # ソート用の日付更新
    def last_post(user)
			@user.user_time = Time.zone.now
      if user.admin_user.check.present? && user.admin_user.check != 0
        # 違反者
        @user.last_post = Time.zone.now.ago(3.years)
      else
        @user.last_post = Time.zone.now
      end
    end

    # ギャラリー数のカウント
    def gallery_counts(user)
      @gallery_count = 0
      @user.blogs.map { |blog|
        @gallery_count += 1 if blog.image_01.present?
        @gallery_count += 1 if blog.image_02.present?
        @gallery_count += 1 if blog.image_03.present?
        @gallery_count += 1 if blog.image_04.present?
      }

    end



end