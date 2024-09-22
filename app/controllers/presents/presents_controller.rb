class Presents::PresentsController < Presents::ApplicationController

  before_action :set_search, only: [:index]

  def index

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

  private

  def current_member_can_receive_points?
    last_get_point_at = current_member.last_get_point_at
    last_get_point_at.nil? || last_get_point_at.to_date != Date.current
  end
end
