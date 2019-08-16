module ApplicationHelper
  # adds form errors to the top of the form
  def errors_check(object)
    if object.errors.any?
      render partial: 'application/errors', locals: {object: object}, class: "alert alert-error fields_with_errors"
    end
  end
end
