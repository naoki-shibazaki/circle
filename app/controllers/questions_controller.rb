class QuestionsController < ApplicationController

	before_action :set_user


	def index
		@question = @user.questions.build

	    @question_sample = "活動頻度はどれくらいですか？？"
	end	

	def new

	end


	def create

		if @user.questions.create(question_params)

			redirect_to user_questions_path(@user)

		else
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

		if @user.switch.present?
		@b5_name = @question.content
		@b5_url = ""		
		end

	end

	def question
		@question = @user.questions.build

	    @question_sample = "活動頻度はどれくらいですか？？"


		if @user.switch.present?
		@b5_name = @question_sample
		@b5_url = ""		
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

		if @user.switch.present?
		@b1_name = @user.event.name
		@b1_url = "/#{@user.event.ruby}"
		@b2_name = @user.prefecture.name
		@b2_url = "/#{@user.event.ruby}/#{@user.prefecture.kana}"	
		@b3_name = @user.name
		@b3_url = "/users/#{@user.id}"
		@b4_name = "質問コーナー"
		@b4_url = "/users/#{@user.id}/questions"		
		end

    end    


end
