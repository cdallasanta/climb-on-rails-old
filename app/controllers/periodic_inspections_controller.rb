class PeriodicInspectionsController < ApplicationController
  before_action :check_logged_in

  def new
    @element = Element.find_by(id:params[:element_id])
    @inspection = PeriodicInspection.new(element: @element)
  end

  def create
    @element = Element.find_by(id:params[:element_id])
    @inspection = PeriodicInspection.new(element: @element)
  end

  def show
    @element = Element.find_by(id:params[:element_id])
    @inspection = PeriodicInspection.find_by(id: params[:id])
  end

  def edit
    @element = Element.find_by(id:params[:element_id])
    @inspection = PeriodicInspection.find_by(id: params[:id])
  end

  def update
  end

end
