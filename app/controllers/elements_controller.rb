class ElementsController < ApplicationController
  before_action :check_logged_in

  def index
    @elements = current_site.elements
  end
end
