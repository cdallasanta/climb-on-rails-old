class PreuseInspectionsController < ApplicationController
  before_action :check_logged_in

  def create
    @inspection = PreuseInspection.find_or_create_todays_inspection(params[:element_id])
    @inspection.setup = PreuseInspection::Setup.create if @inspection.setup == nil

    if @inspection.valid?
      redirect_to edit_element_preuse_inspection_path(@inspection.element, @inspection)
    else
      flash[:alert] = "Element not found"
      render elements_path
    end
  end

  def index
    @element = Element.find_by(params[:element_id])
  end

  def show
    #TODO is this used?
  end
  # currently, no #new is needed, TODO remove route from config

  def edit
    @inspection = PreuseInspection.find_by(id: params[:id])
    @element = @inspection.element
    #TODO check for url schenanegains for both element and inspection

    if @inspection.setup.is_complete?
      @inspection.takedown ||= PreuseInspection::Takedown.create
    end
  end

  def update
    #updating preuse (just the date, really)
    preuse = PreuseInspection.find_by(id: params[:id])
    preuse.date = preuse_params[:date]
    #save preuse for date validation
    # TODO should be something for if that date already has an inspection
    unless preuse.save
      render element_preuse_inspection_path(preuse.element, preuse)
    end

    #updating setup
    setup = preuse.setup
    if setup.will_change?(preuse_params[:preuse_inspection_setup])
      setup.users << current_user unless setup.users.include?(current_user)
      setup.update(preuse_params[:preuse_inspection_setup])
    end

    #updating takedown
    takedown = preuse.takedown
    if takedown
      if takedown.will_change?(preuse_params[:preuse_inspection_takedown])
        takedown.users << current_user unless takedown.users.include?(current_user)
        takedown.update(preuse_params[:preuse_inspection_takedown])
      end
    end

    #TODO flash message for success? also check for other errors, like form editing?
    redirect_to edit_element_preuse_inspection_path(preuse.element, preuse)
  end

  private

  def preuse_params
    params.require(:preuse_inspection).permit(
      :date,
      preuse_inspection_setup:
        [:equipment_complete, :element_complete, :environment_complete],
      preuse_inspection_takedown:
        [:equipment_complete, :element_complete, :environment_complete]
      )
  end
end
