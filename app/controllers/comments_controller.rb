class CommentsController < ApplicationController
  def index
    @comments = Site.recent_comments(current_site)
  end
end
