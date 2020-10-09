class MembersController < ApplicationController

    before_action :ensure_correct_member, {only: [:edit, :update]}
	before_action :set_member

	def index
        @member = Member.find(params[:id])
	end	

	def create

	end	

    def edit
        @member = Member.find(params[:id])
    end

    def update
        @member = Member.find(params[:id])

        if @member.random_id.nil?
            @member.random_id = SecureRandom.alphanumeric(6)
        end

        if @member.update(member_params)

            flash[:notice] = 'プロフィール更新完了！'
            redirect_to users_path
        else
            render "edit"
        end         
    end

    def show
        @member = Member.find(params[:id])
        @event_answers = EventAnswer.where(member_id: @member.id)
        @events = Event.all

        if @member.id == current_member.id
            @bookmarks = Bookmark.where(member_id: current_member.id).map { |m| m.user_id }
            @users = User.where(id: @bookmarks)            
        end


        @event_questions = EventQuestion.all


        # パンくず
        @b1_name = @member.nickname
        @b1_url = ""
    end     

    def ensure_correct_member
       if current_member.id != params[:id].to_i
            if current_member.id == 1               

            else
              flash[:notice] = "権限がありません"
              redirect_to members_path

            end
       end
    end


    def set_member
    	@event = Event.find_by(ruby: params[:ruby])
    	@event_question = EventQuestion.find_by(id: params[:id])
    end


    private
    def member_params
    	params.require(:member).permit(:id, :email, :event_question_id, :nickname, :image_profile, :answer, :gender, :profile)
    end


end