class EventQuestionsController < ApplicationController

	before_action :set_event_question

	def index 
		@event_question = @event.event_questions.build  
		@event_questions = EventQuestion.where(event_id: @event.id).order(created_at: "DESC")
	end	

	def create
		if @event.event_questions.create(event_question_params)	
			flash[:notice] = '投稿しました！'
			redirect_to "/#{@event.ruby}/qa"
		else
			flash[:notice] = '質問が空欄です'			
			render "/#{@event.ruby}/qa"
		end
	end	

	def show
		@event_question = EventQuestion.find_by(id: params[:id])
		@event_answer = @event_question.event_answers.build
	end	

	def new

	end		

	def update

	end	

	def event_questions
		@event_questions = EventQuestion.all.order(created_at: "DESC")
		@events = Event.all
	end


    def set_event_question
    	@event = Event.find_by(ruby: params[:ruby])
		@event_questions = EventQuestion.all.order(created_at: "DESC")
    end


    private
    def event_question_params
    	params.require(:event_question).permit(:id, :question, :event_id, :answer)
    end



end
