class QuestionsController < ApplicationController

	before_action :set_user


	def index

	end	

	def top

	end	

	def new

	end

	def create
		@user.questions.create(question_params)
		redirect_to user_questions_path(@user)
	end

	def show
		@question = Question.find(params[:id])
	end

	def edit

	end

	def update

	end

	def destroy

	end


	def set_user
	    @user = User.find_by(id: params[:user_id])
    end

    private
    def question_params
    	params.require(:question).permit(:content, :id)
    end


end
