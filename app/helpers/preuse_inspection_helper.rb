module PreuseInspectionHelper
  def takedown_partial_if_exists(f)
    if @inspection.takedown
      render partial: "takedown", locals: {f:f, takedown: @inspection.takedown}
    end
  end
end
