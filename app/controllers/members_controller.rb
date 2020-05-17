class MembersController < ApplicationController

    before_action :ensure_correct_member, {only: [:edit, :update]}
	before_action :set_member

	def index

	end	

	def create

	end	

    def edit
        @member = Member.find(params[:id])
    end

    def update
        @member = Member.find(params[:id])

        if @member.update(member_params)

            flash[:notice] = 'アカウント更新！'
            redirect_to member_path
        else
            render "/members/#{@member.id}/edit"
        end         
    end

    def show

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
    	params.require(:member).permit(:id, :email, :event_question_id, :name, :nickname, :image_profile, :answer)
    end


end