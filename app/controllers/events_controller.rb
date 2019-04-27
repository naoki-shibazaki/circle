class EventsController < ApplicationController


	before_action :set_event


	def set_event
		@event = Event.all.order(updated_at: "DESC").find_by(kana: params[:kana])
		@events = Event.all.order(updated_at: "DESC").where.not(kana: "nil")
	end	


end
