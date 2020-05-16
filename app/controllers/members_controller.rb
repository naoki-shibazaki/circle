class MembersController < ApplicationController

	before_action :set_member

	def index

	end	

	def create

	end	


    def set_member
    	@event = Event.find_by(ruby: params[:ruby])
    	@event_question = EventQuestion.find_by(id: params[:id])
    end


    private
    def member_params
    	params.require(:member).permit(:id, :email, :event_question_id, :name, :nickname, :image_profile, :answer)
    end


end