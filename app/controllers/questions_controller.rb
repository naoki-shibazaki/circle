class QuestionsController < ApplicationController

	before_action :set_user


	def index
		@question = @user.questions.build
	    @questions = Question.where(user_id: @user.id).order(id: "DESC")
    
	end	


	def question
		@question = @user.questions.build
		@questions = Question.where(user_id: @user.id).order(id: "DESC")


		if params[:sample] == "first"
			@question_sample = @question_first

		elsif params[:sample] == "second"
			@question_sample = @question_second

		elsif params[:sample] == "third"
			@question_sample = @question_third

		else

		end


		if @user.switch.present?
		@b5_name = @question_sample
		@b5_url = ""		
		end

	end


	def new

	end


	def create

		if @user.questions.create(question_params)		

			if admin_user_signed_in?
				if current_admin_user.id == @user.id
					@user.last_post = Time.now
					@user.user_time = Time.now
					@user.save	
				end
			end

			flash[:notice] = '質問を送信しました！'
			redirect_to user_questions_path(@user)

		else

			flash[:notice] = '質問が空欄です'			
			render user_questions_path(@user)
		end



	end

	def update
		@question = Question.find(params[:id])

		if @question.update(question_params)

			@user.last_post = Time.now
			@user.user_time = Time.now
			@user.save	

			flash[:notice] = '更新しました！'
			redirect_to user_question_path
		end

	end

	def show
		@question = Question.find(params[:id])
	    @questions = Question.where(user_id: @user.id).order(id: "DESC")

		if @user.id.to_i != @question.user_id.to_i
			flash[:notice] = "存在しないURLです"
			redirect_to "/users"
		end

		if @user.switch.present?
		@b5_name = @question.content
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


	def questions
		@questions = Question.all.order(id: "DESC").page(params[:page])
	end

	def set_user
	    @user = User.find_by(id: params[:user_id])

	    @question_first = "コロナの影響はありますか？？"
	    @question_second = "男女比を教えてください"
	    @question_third = "初心者でも参加しやすいですか？"


	    if @user.present?  	
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


    private
    def question_params
    	params.require(:question).permit(:id, :content, :answer)
    end



end
