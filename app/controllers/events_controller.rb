class EventsController < ApplicationController
  def index
    category = Category.find(params[:category_id])
    render json: category.events.select(:id, :name)
  end
end