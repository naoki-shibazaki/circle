class QuestionsController < ApplicationController

	before_action :set_user


	def index
		@question = @user.questions.build
	end	

	def top

	end	

	def new

	end


	def create
		if @user.questions.create(question_params)

			redirect_to user_questions_path(@user)

		else
			flash[:share] = '最大90文字です'
			render user_questions_path(@user)
		end
	end

	def update
		@question = Question.find(params[:id])

		if @question.update(question_params)
			flash[:share] = '更新しました！'
			redirect_to user_question_path
		end

	end

	def show
		@question = Question.find(params[:id])

		if @user.id.to_i != @question.user_id.to_i
			flash[:notice] = "存在しないURLです"
			redirect_to "/users"
		end

	end

	def edit

	end

	def destroy
		@question = @user.questions.find(params[:id])
		@question.destroy

		flash[:notice] = "削除しました"
		redirect_to user_questions_path
	end

    private
    def question_params
    	params.require(:question).permit(:id, :content, :answer)
    end

	def set_user
	    @user = User.find_by(id: params[:user_id])

	    @questions = Question.where(user_id: @user.id).order(id: "DESC")
    end    


end
