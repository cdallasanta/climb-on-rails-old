class PeriodicInspectionsController < ApplicationController
  before_action :check_for_element_and_periodic_existance, :authenticate_user!, except: [:find_by_date]
  before_action :remove_empty_comments, only: [:create, :update]

  # /elements/:element_id/periodic_inspections/new
  def new
    params[:date] ? date = params[:date] : date = Date.today.to_s

    @inspection = PeriodicInspection.find_or_init_past_inspection(date, @element.id)
    if @inspection.id != nil
      redirect_to element_periodic_inspection_path(@element, @inspection)
    else
      @inspection.comments.build(user:current_user)
    end
  end

  def create
    @inspection = PeriodicInspection.new(element: @element)

    # if the inspection will change when saved, add the current user to be referenced by
    # 'edited by', and also reduced the number of calls to the db
    @inspection.assign_attributes(periodic_params)
    if @inspection.changed_for_autosave?
      @inspection.users << current_user unless @inspection.users.include?(current_user)
      if @inspection.save
        flash[:alert] = "Inspection logged successfully"
        redirect_to element_periodic_inspection_path(@element, @inspection)
      else
        render :edit
      end
    end
  end

  # from datepicker JS
  # /elements/:element_id/periodic_inspections/date/:date
  def find_by_date
    @inspection = PeriodicInspection.find_or_init_past_inspection(params[:date], params[:element_id])
    if @inspection.id != nil
      binding.pry
      render js: "window.location = '#{element_periodic_inspection_url(@element, @inspection)}'"
    else
      render js: "window.location = '#{new_element_periodic_inspection_url(@inspection.element)}?date=#{params[:date]}'"
    end
  end

  # /elements/:element_id/periodic_inspections/:id
  def show
    # @inspection is set in the before_action, check_for_element_and_inspection
  end

  # /elements/:element_id/periodic_inspections/:id/edit
  def edit
    # @inspection is set in the before_action, check_for_element_and_inspection
    @inspection.comments.build(user:current_user)
  end

  def update
    @inspection.assign_attributes(periodic_params)

    if @inspection.changed_for_autosave?
      @inspection.users << current_user unless @inspection.users.include?(current_user)
      if @inspection.save
        flash[:alert] = "Inspection logged successfully"
        redirect_to element_periodic_inspection_path(@element, @inspection)
      else
        render :edit
      end
    else
      redirect_to element_periodic_inspection_path(@element, @inspection)
    end
  end

  private

  def periodic_params
    params.require(:periodic_inspection).permit(
      :date,
      :equipment_complete,
      :element_complete,
      :environment_complete,
      comments_attributes: [
        :user_id,
        :content,
        :id
      ]
    )
  end

  # stopping url shenanigans, and also setting instance variables
  def check_for_element_and_periodic_existance
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

  #  TODO is this necessary?
  # def check_for_previous_periodic_on_that_date
  #   previous_inspection = PeriodicInspection.find_by(date: params[:periodic_inspection][:date], element:@element.id)
  #   if previous_inspection != @inspection
  #     flash[:alert] = "There is already an inspection logged for that date. View/edit it <a href='#{edit_element_periodic_inspection_path(@element, previous_inspection)}'>here</a>"
  #     if @inspection
  #       render :edit and return
  #     else
  #       redirect_to new_element_periodic_inspection_path(@element) and return
  #     end
  #   end
  # end

  def remove_empty_comments
    params[:periodic_inspection][:comments_attributes].delete_if do |num, comment|
      comment[:content] == ""
    end
  end
end
