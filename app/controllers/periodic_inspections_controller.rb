class PeriodicInspectionsController < ApplicationController
  before_action :check_logged_in, :check_for_element_and_inspection_existance

  def new
    @inspection = PeriodicInspection.new(element: @element)
    @inspection.comments.build(user:current_user)
  end

  def create
    binding.pry
    @inspection = PeriodicInspection.find_or_create_by_date(@element, params[:periodic_inspection][:date])

    if @inspection.update(periodic_params)
      @inspection.users << current_user unless @inspection.users.include?(current_user)
      flash[:alert] = "Inspection logged successfully"
      redirect_to element_periodic_inspection_path(@element, @inspection)
    else
      render edit_element_periodic_inspection_path(@element, @inspection)
    end
  end

  def show
    # @inspection is set in the before_action, check_for_element_and_inspection
  end

  def edit
    # @inspection is set in the before_action, check_for_element_and_inspection
  end

  def update
    if @inspection.update(periodic_params)
      @inspection.users << current_user unless @inspection.users.include?(current_user)
      flash[:alert] = "Inspection logged successfully"
      redirect_to element_periodic_inspection_path(@element, @inspection)
    else
      render edit_element_periodic_inspection_path(@element, @inspection)
    end
  end

  private

  def periodic_params
    params.require(:periodic_inspection).permit(
      :equipment_complete,
      :element_complete,
      :environment_complete,
      comments: {}
    )
  end

  def check_for_element_and_inspection_existance
    @element = Element.find_by(id:params[:element_id])
    if @element
      if params[:id]
        @inspection = @element.periodic_inspections.find_by(id: params[:id])
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
end
