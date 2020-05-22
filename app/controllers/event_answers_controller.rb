class EventAnswersController < ApplicationController

	before_action :set_event_answer
	before_action :ensure_correct_member, {only: [:edit, :update]}	

	def index 

	end	

	def create
		if @event_question.event_answers.create(event_answer_params)

			flash[:notice] = '回答しました！'
			redirect_to "/#{@event.ruby}/qa/#{@event_question.id}"


		else
			flash[:notice] = '回答が空欄です'			
			render "/#{@event.ruby}/qa/#{@event_question.id}"
		end
	end	

	def show

	end	

	def new

	end		

	def update

	end	

	def delete
		@event_answer = EventAnswer.find_by(id: params[:id])
	    @event_question = EventQuestion.find_by(id: @event_answer.event_question_id)

   		@event_answer.destroy		

		redirect_to("/event_questions")
	end	


    def set_event_answer
    	@event = Event.find_by(ruby: params[:ruby])
    	@event_question = EventQuestion.find_by(id: params[:id])	
    end

	def ensure_correct_user
		@event_question = EventQuestion.find_by(id: params[:id])

	   		if current_member.id == 1

		   	else
		      flash[:notice] = "権限がありません"
		      redirect_to "/event_questions"
		    end
	end	

    private
    def event_answer_params
    	params.require(:event_answer).permit(:id, :answer, :event_question_id, :answer_member_id, :member_id)
    end


end
