class Blogs::Events::EventsController < Blogs::Events::ApplicationController
  before_action :set_search, only: [:show]

	def index
    redirect_to blogs_path, status: 301
  end


  def show
		@event = Event.find_by(ruby: params[:kana])

    user_ids = User.where(event_id: @event.id).users_list.pluck(:id)
    @blogs = Blog.list(user_ids).page(params[:page])

  end



end