module PeriodicInspectionHelper
  # comments with content are put in an uneditable fashion, and the
  # new empty comments area textfields for adding comments
  def textarea_or_straight_text(ff)
    if ff.object.content == nil
      ff.text_area :content
    else
      "<div class=\"instructions-text\"><strong>#{ff.object.user.fullname}:</strong> #{ff.object.content}</div>".html_safe
    end
  end
end
