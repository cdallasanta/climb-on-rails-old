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
    @element = Element.find_by(id: params[:id])
    binding.pry
    @element.update(element_params.except(:ropes_attributes))
    @element.update_ropes(element_params[:ropes_attributes])

    redirect_to element_path(@element)
  end

  def new
  end

  def create
  end

  private

  def element_params
    params.require(:element).permit(
      :name,
      :setup_equipment_instructions,
      :setup_element_instructions,
      :setup_envvironment_instructions,
      :takedown_equipment_instructions,
      :takedown_element_instructions,
      :takedown_envvironment_instructions,
      :periodic_equipment_instructions,
      :periodic_element_instructions,
      :periodic_envvironment_instructions,
      ropes_attributes: {}
    )
  end

  def string_to_html(text)
    text.sub("\n","<br>")
  end
end
