class ElementsController < ApplicationController
  before_action :check_logged_in

  def index
    @elements = current_site.elements
  end

  def show
    @element = Element.find_by(id: params[:id])

    unless @element
      flash[:alert] = "Element not found"
      render root_path
    end
  end

  def edit
    @element = Element.find_by(id: params[:id])

    unless @element
      flash[:alert] = "Element not found"
      render root_path
    end
  end

  def update
  end

  def new
  end

  def create
  end
end
