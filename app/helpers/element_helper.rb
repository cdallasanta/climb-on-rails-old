module ElementHelper
  # used to convert the <br> stored in the db to a line break for the textarea
  def html_to_string(text)
    text.gsub("<br>","\n")
  end

  # text field for each non-retired rope
  def ropes_fields(f)
    f.fields_for :ropes do |ff|
      if !ff.object.retired
        ff.text_field(:identifier) + "<br>".html_safe
      end
    end
  end
end