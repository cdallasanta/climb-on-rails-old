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
    @inspection.setup.comments.build(user:current_user)
    if @inspection.setup.is_complete?
      @inspection.takedown ||= PreuseInspection::Takedown.create
      @inspection.takedown.comments.build(user:current_user)
    end
  end

  def update
    #updating preuse (just the date, really)
    @inspection.date = preuse_params[:date]
    #save preuse for date validation
    unless @inspection.save
      render element_preuse_inspection_path(@element, @inspection) and return
    end
    remove_empty_comments
    #updating setup
    setup = PreuseInspection::Setup.find_by(id: preuse_params[:setup_attributes][:id])
    if setup == @inspection.setup
      setup.assign_attributes(preuse_params[:setup_attributes])

      if setup.changed_for_autosave?
        setup.save
        setup.users << current_user unless setup.users.include?(current_user)
        flash[:alert] = "Inspection logged successfully"
      end
    else
      flash[:alert] = "Setup inspection id not found"
      render edit_element_preuse_inspection_path(@inspection.element, @inspection) and return
    end

    #updating takedown
    if preuse_params[:takedown_attributes]
      takedown = PreuseInspection::Takedown.find_by(id: preuse_params[:takedown_attributes][:id])
      if takedown == @inspection.takedown
        # update checkboxes,comments, and update/create climbs
        takedown.assign_attributes(preuse_params[:takedown_attributes])
        if takedown.changed_for_autosave?
          takedown.save
          takedown.users << current_user unless takedown.users.include?(current_user)
          flash[:alert] = "Inspection logged successfully"
        end
      else
        flash[:alert] = "Takedown inspection id not found"
        render edit_element_preuse_inspection_path(@inspection.element, @inspection) and return
      end
    end

    redirect_to edit_element_preuse_inspection_path(@inspection.element, @inspection)
  end

  private

  def preuse_params
    params.require(:preuse_inspection).permit(
      :date,
      setup_attributes: [
        :equipment_complete,
        :element_complete,
        :environment_complete,
        :id,
        comments_attributes: [
          :user_id,
          :content,
          :id
        ]
      ],
      takedown_attributes: [
        :equipment_complete,
        :element_complete,
        :environment_complete,
        :id,
        ropes_attributes: [
          :id,
          climbs_attributes: [
            :number_of_climbs,
            :id
          ]
        ],
        comments_attributes: [
          :user_id,
          :content
        ]
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

  # TODO is this needed anymore?
  def check_for_previous_inspection_on_that_date
    previous_inspection = PreuseInspection.find_past_inspection(params[:preuse_inspection][:date], @element.id)
    if previous_inspection
      flash[:alert] = "There is already a preuse inspection for that date. View it <a href='#{edit_element_preuse_inspection_path(@element, previous_inspection)}'>'here'</a>".html_safe
      redirect_to element_preuse_inspections_path(@element) and return
    end
  end

  def remove_empty_comments
    params[:preuse_inspection][:setup_attributes][:comments_attributes].delete_if do |num, comment|
      comment[:content] == ""
    end

    if params[:preuse_inspection][:takedown_attributes]
      params[:preuse_inspection][:takedown_attributes][:comments_attributes].delete_if do |num, comment|
        comment[:content] == ""
      end
    end
  end
end
