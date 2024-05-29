class Exhibitions::ExhibitionContactsController < Exhibitions::ApplicationController

  def create
    # @exhibition = current_exhibition_group.exhibitions.build(exhibition_params)

    # if @exhibition.save
    #   redirect_to exhibition_path(@exhibition), notice: '保存できました！'
    # else
    #   flash.now[:error] = '保存に失敗しました'
    #   render :new
    # end
  end


private
  def exhibition_contact_params
    params.require(:exhibition_contact).permit(
      :name,
      :email,
      :email_confirmation,
    )
  end




end