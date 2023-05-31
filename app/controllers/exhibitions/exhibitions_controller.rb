class Exhibitions::ExhibitionsController < Exhibitions::ApplicationController


  def new
		@exhibition = current_exhibition_group.exhibitions.build
  end

  def show
    @exhibition = Exhibition.find(params[:id])
		@exhibition_contact = @exhibition.exhibition_contacts.build
  end

  def create
    @exhibition = current_exhibition_group.exhibitions.build(exhibition_params)

    if @exhibition.save
      redirect_to exhibition_path(@exhibition), notice: '保存できました！'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
		@exhibition = Exhibition.find(params[:id])
  end

  def update
		@exhibition = Exhibition.find(params[:id])

    if @exhibition.update(exhibition_params)
      redirect_to exhibition_path(@exhibition), notice: '保存できました！'
    else
      flash.now[:error] = '保存に失敗しました'
      render :edit
    end

  end


private
  def exhibition_params
    params.require(:exhibition).permit(
      :exhibition_group_id,
      :prefecture_id,
      :name,
      :event_date,
      :end_date,
      :header_img,
      :gallery_img_01,
      :gallery_img_02,
      :gallery_img_03,
      :gallery_img_04,
      :venue_name,
      :venue_address,
      :detail,
      :online,
      :show_contact,
      :exhibit_person_price,
      :visitor_price
    )
  end




end