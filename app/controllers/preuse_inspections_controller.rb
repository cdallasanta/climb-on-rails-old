class PreuseInspectionsController < ApplicationController
  before_action :check_logged_in

  def new
    @inspection = PreuseInspection.new
  end
end
