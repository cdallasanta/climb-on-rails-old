module PreuseInspectionHelper
  def takedown_partial_if_exists(f)
    if @inspection.takedown
      render partial: "takedown", locals: {f:f, takedown: @inspection.takedown}
    end
  end

  def updated_by_div(object)
    unless object.users == []
      names = object.users.collect do |user|
        user.fullname + '<br>'
      end.join.html_safe

      render partial: "periodic_inspections/updated_by", locals: {names: names}
    end
  end
end
