class ExhibitorApps::ExhibitorMypagesController < ExhibitorApps::ApplicationController

  def show
    if current_exhibition_group.profile.blank?
      redirect_to edit_exhibitor_profile_path, notice: 'プロフィールを登録してください'
    end
  end


end