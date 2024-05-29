class Exhibitions::ExhibitorsController < Exhibitions::ApplicationController

  def show
    @exhibitor = ExhibitionGroupProfile.find(params[:id])
    @exhibitions = Exhibition.where(exhibition_group_id: @exhibitor.id).includes([:prefecture, :exhibition_group]).order(end_date: "desc")
  end

end