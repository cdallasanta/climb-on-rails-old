module PeriodicInspectionHelper
  def textarea_or_straight_text(ff)
    if ff.object.content == nil
      ff.text_area :content
    else
      "<strong>#{ff.object.user.fullname}:</strong> #{ff.object.content}<br>".html_safe
    end
  end
end
