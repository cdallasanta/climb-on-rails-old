class PreuseInspectionsController < ApplicationController
  before_action :check_logged_in

  def new
    # this somewhat breaks convention by creating in the GET route, but I can't figure out how to have
    # elements/index direct to the POST route
    @inspection = PreuseInspection.new(date:Date.today, element: Element.find_by(params[:element_id]))
    @inspection.setup = PreuseInspection::Setup.create

    if @inspection.save
      redirect_to element_preuse_inspection_path(@inspection.element, @inspection)
    else
      flash[:alert] = "Element not found"
      render elements_path
    end
  end

  # currently, no #create is needed, TODO remove route

  def show
    @inspection = PreuseInspection.find_by(id: params[:preuse_inspection_id])
    @element = @inspection.element
    #TODO check for url schenanegains
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
