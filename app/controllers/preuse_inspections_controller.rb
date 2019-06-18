class PreuseInspectionsController < ApplicationController
  before_action :check_logged_in, :check_for_element_and_inspection_existance

  def create
    @inspection = PreuseInspection.find_or_create_todays_inspection(params[:element_id])
    @inspection.setup = PreuseInspection::Setup.create if @inspection.setup == nil

    redirect_to edit_element_preuse_inspection_path(@inspection.element, @inspection)
  end

  def index
    if params[:date]
      @inspection = PreuseInspection.find_past_inspection(params[:date], @element.id)
    end
  end

  def edit
    if @inspection.setup.is_complete?
      @inspection.takedown ||= PreuseInspection::Takedown.create
    end
  end

  def update
    binding.pry
    check_for_previous_inspection_on_that_date
    #updating preuse (just the date, really)
    @inspection.date = preuse_params[:date]
    #save preuse for date validation
    unless @inspection.save
      render element_preuse_inspection_path(@element, @inspection)
    end

    #updating setup
    setup = @inspection.setup
    if setup.will_change?(preuse_params[:setup_attributes])
      setup.users << current_user unless setup.users.include?(current_user)
      setup.update(preuse_params[:setup_attributes])
    end

    #updating takedown
    takedown = @inspection.takedown
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

  def check_for_element_and_inspection_existance
    @element = Element.find_by(id:params[:element_id])
    if @element
      if params[:id]
        @inspection = @element.preuse_inspections.find_by(id: params[:id])
        if @inspection.nil?
          flash[:alert] = "Inspection id not found under that element"
          redirect_to element_path(@element)
        end
      end
    else
      flash[:alert] = "No element found with that id"
      redirect_to root_path
    end
  end

  def check_for_previous_inspection_on_that_date
    previous_inspection = PreuseInspection.find_past_inspection(params[:date], @element.id)
    if previous_inspection
      flash[:alert] = "There is already a preuse inspection for that date. View it #{link_to 'here', edit_element_preuse_inspection_path(@element, previous_inspection)}"
      redirect_to element_preuse_inspections_path(@element)
    end
  end
end
