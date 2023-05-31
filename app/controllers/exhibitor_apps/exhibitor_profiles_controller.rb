class ExhibitorApps::ExhibitorProfilesController < ExhibitorApps::ApplicationController

  def edit
    @profile = current_exhibition_group.prepare_profile
  end

  def update
    @profile = current_exhibition_group.prepare_profile
    @profile.assign_attributes(exhibition_group_profile_params)
    @profile.exhibition_category_id = 1
    if @profile.save
      redirect_to exhibitor_path(@profile.id), notice: 'プロフィール更新完了！'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  private
  def exhibition_group_profile_params
    params.require(:exhibition_group_profile).permit(
      :exhibition_group_id,
      :exhibition_category_id,
      :name,
      :header_img,
      :profile_img,
      :instagram_id,
      :twitter_id,
      :web_url,
      :introduction
    )
  end

end