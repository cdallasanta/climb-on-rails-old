class RopesController < ApplicationController

  def update
    @rope = Element::Rope.find(params[:id])
    @rope.update(retired: true)
    redirect_to new_element_rope_path(@rope.element, @rope)
  end

  def new
    @rope = Element::Rope.new(element: Element.find(params[:element_id]))
  end

  def create
    rope = Element::Rope.create(rope_params)
    redirect_to element_path(rope.element)
  end

  private

  def rope_params
    params.require(:element_rope).permit(:identifier, :element_id)
  end
end
