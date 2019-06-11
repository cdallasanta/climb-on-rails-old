class PreuseInspectionsController < ApplicationController
  def new
    @inspection = PreuseInspection.new
  end
  
end
