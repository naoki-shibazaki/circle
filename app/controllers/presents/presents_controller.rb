class Presents::PresentsController < Presents::ApplicationController

  POINTS_REQUIRED_FOR_APPLICATION = 30

  before_action :set_search, only: [:index]

  def index
    if current_member
      @can_receive_points = current_member_can_receive_points?
      @winners = Application.where.not(won_at: nil)
                            .where(won_at: Time.current.beginning_of_month..Time.current.end_of_month)
    end
  end

  def point
    if current_member_can_receive_points?
      current_member.update(points: current_member.points + 1, last_get_point_at: Time.current)
      flash[:notice] = "ポイントが加算されました。"
    else
      flash[:notice] = "本日はすでにポイントを取得しています。"
    end

    redirect_to action: :index
  end

  def apply
    if current_member.can_apply?
      if current_member.points >= POINTS_REQUIRED_FOR_APPLICATION
        # ポイントを減算し、応募情報を作成
        current_member.update(points: current_member.points - POINTS_REQUIRED_FOR_APPLICATION)
        Application.create(
            member_id: current_member.id,
            applied_at: Time.current,
            points_used: POINTS_REQUIRED_FOR_APPLICATION,
            status: 'pending'
        )
        flash[:notice] = "応募が完了しました。"
      else
        flash[:notice] = "ポイントが足りません。"
      end
    else
      flash[:notice] = "抽選までお待ちください。"
    end
    redirect_to presents_path
  end

  private

  def current_member_can_receive_points?
    last_get_point_at = current_member.last_get_point_at
    last_get_point_at.nil? || last_get_point_at.to_date != Date.current
  end
end
