class Exhibitions::ExhibitorsController < Exhibitions::ApplicationController

  def show
    @exhibitor = ExhibitionGroupProfile.find(params[:id])
  end

end