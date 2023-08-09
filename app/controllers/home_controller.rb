class HomeController < ApplicationController
  def index
    @categories = Category.all.order(:order => :asc)
    @prefectures = Prefecture.all.order(:order => :asc)
    @users = User.where(ng_account: nil).or(User.where(ng_account: "OK")).where.not(switch: "", appeal: "").order(switch: :asc, last_post: :desc)

    @match_events = Event.where(matching: 1).order(:order => :asc)
		@place_events = Event.where(place: 1).order(:order => :asc)
    @match_users = Match.where(recruit: "募集中").order(updated_at: "DESC")

  end
end