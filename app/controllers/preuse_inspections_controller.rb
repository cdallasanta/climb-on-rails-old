class PreuseInspectionsController < ApplicationController
  before_action :check_logged_in

  def create
    @inspection = PreuseInspection.find_or_create_todays_inspection(params[:element_id])
    @inspection.setup = PreuseInspection::Setup.create if @inspection.setup == nil

    if @inspection.valid?
      redirect_to element_preuse_inspection_path(@inspection.element, @inspection)
    else
      flash[:alert] = "Element not found"
      render elements_path
    end
  end

  # currently, no #new is needed, TODO remove route from config

  def show
    @inspection = PreuseInspection.find_by(id: params[:id])
    @element = @inspection.element
    #TODO check for url schenanegains for both element and inspection
    @setup = @inspection.setup

    if @setup.is_complete?
      @inspection.takedown ||= PreuseInspection::Takedown.create
    end
  end

  def edit
  end

  def update
  end
end
