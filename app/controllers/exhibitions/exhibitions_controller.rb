class Exhibitions::ExhibitionsController < Exhibitions::ApplicationController

  before_action :set_exhibitions


  def new
		@exhibition = current_exhibition_group.exhibitions.build
  end

  def show
  end

private
  def set_exhibitions

  end




end