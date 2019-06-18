module PeriodicInspectionHelper
  def inspection_comments
    f.label "Comments:"
    @inspection.comments.each do |comment|
      "#{comment.user.fullname}: #{comment.content}"
    end
    fields_for :comments do |ff|
      ff.text_area :content
    end
  end
end
