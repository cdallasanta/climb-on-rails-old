module ElementHelper
  def rope_details
    @element.ropes.collect do |rope|
      "<div class=\"rope-details\">
        <h3>#{rope.identifier}</h3>
        Total climbs: #{rope.climb_count}<br>
        #{link_to "Edit or replace rope", edit_element_rope_path(@element, rope)}
      </div>"
    end.join.html_safe
  end

  def html_to_string(text)
    text.sub("<br>","\n")
  end

  def ropes_fields(f)
    two_new_ropes(@element)
    f.fields_for :ropes do |ff|
      ff.text_field(:identifier) + "<br>".html_safe
    end
  end

  def two_new_ropes(element)
    element.ropes.new
    element.ropes.new
  end
end
