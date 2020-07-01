class EventQuestionsController < ApplicationController

	before_action :set_event_question
	before_action :ensure_correct_member, {only: [:edit, :update]}


	def index 
		@event_question = @event.event_questions.build  
		@event_questions = EventQuestion.where(event_id: @event.id).order(created_at: "DESC").page(params[:page])

		@search = EventQuestion.where(event_id: @event.id).order(created_at: "DESC").ransack(params[:q])
		@search_questions = @search.result.page(params[:page])

		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = "質問コーナー"
		@b2_url = "/#{@event.ruby}/qa"	
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
		@event = Event.find_by(ruby: params[:ruby])
		@event_questions = EventQuestion.where(event_id: @event.id).order(created_at: "DESC").page(params[:page])

		if @event.id != @event_question.event.id
		      flash[:notice] = "URLが間違っています"
		      redirect_to users_path			
		end


		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = "質問コーナー"
		@b2_url = "/#{@event.ruby}/qa"	
		@b3_name = @event_question.question
		@b3_url = "/#{@event.ruby}/qa/#{@event_question.id}"	
	end	

	def new

	end		

	def update

	end	

	def delete
	    @event_question = EventQuestion.find_by(id: params[:id])
   		@event_question.destroy		

		redirect_to("/event_questions")
	end	

	def event_questions
		@event_questions = EventQuestion.all.order(created_at: "DESC")
		@events = Event.all

		@search = EventQuestion.order(created_at: "DESC").ransack(params[:q])
		@search_questions = @search.result


		# パンくず
		@b1_name = "質問一覧"
		@b1_url = "/event_questions"
	end


    def set_event_question
    	@event = Event.find_by(ruby: params[:ruby])
		@event_questions = EventQuestion.all.order(created_at: "DESC").page(params[:page])
		@members = Member.all
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
    def event_question_params
    	params.require(:event_question).permit(:id, :question, :event_id, :answer)
    end



end
