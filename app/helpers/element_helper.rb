module ElementHelper
  # text field for each non-retired rope
  def ropes_fields(f)
    f.fields_for :ropes do |ff|
      if !ff.object.retired
        ff.text_field(:identifier) + "<br>".html_safe
      end
    end
  end
end