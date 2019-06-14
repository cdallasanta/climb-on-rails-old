module PreuseInspectionHelper
  def takedown_partial_if_exists(f)
    if @inspection.takedown
      render partial: "takedown", locals: {f:f, takedown: @inspection.takedown}
    end
  end

  def updated_by_div(object)
    "<div class=\"updated-by\">
      Updated by:<br>
      #{updaters_listed(object)}
    </div>".html_safe
  end

  def updaters_listed(object)
    object.users.collect do |user|
      user.fullname + '<br>'
    end.join
  end

  def show_inspection_if_selected
    if @inspection
      render partial: "preuse_inspection", locals: {inspection: @inspection}
    end
  end
end
