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
    if params[:date]
      @inspection = PreuseInspection.find_past_inspection(params[:date], @element.id)
    end
  end

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
    if setup.will_change?(preuse_params[:setup_attributes])
      setup.users << current_user unless setup.users.include?(current_user)
      setup.update(preuse_params[:setup_attributes])
    end

    #updating takedown
    takedown = preuse.takedown
    if takedown
      if  takedown == PreuseInspection::Takedown.find_by(id: preuse_params[:takedown_attributes][:id])
      # TODO temporarily broken: if takedown.will_change?(preuse_params[:preuse_inspection_takedown])
      # #changed?
        # add users
        takedown.users << current_user unless takedown.users.include?(current_user)
        # update checkboxes and update/create climbs
        takedown.update_everything(preuse_params[:takedown_attributes])
      # end
      else
        flash[:alert] = "Takedown inspection id not found"
        render edit_element_preuse_inspection_path(preuse.element, preuse)
      end
    end

    #TODO flash message for success? also check for other errors, like form editing?
    redirect_to edit_element_preuse_inspection_path(preuse.element, preuse)
  end

  private

  def preuse_params
    params.require(:preuse_inspection).permit(
      :date,
      setup_attributes:
        [:equipment_complete, :element_complete, :environment_complete, :id],
      takedown_attributes:
        [:equipment_complete, :element_complete, :environment_complete, :id,
          ropes_attributes: {}
        ]
      )
  end
end
