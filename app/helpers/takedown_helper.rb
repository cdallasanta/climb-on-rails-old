module TakedownHelper
  def rope_and_climb_fields(ff, takedown)
    ff.fields_for :ropes do |rope_form|
      #go through each rope in the takedown, making a fields_for for each
      takedown.ropes.collect do |rope|
        rope_form.fields_for rope do |indv_rope_form|
          #show the rope's name and 4 climb fields
          indv_rope_form.label(:identifier, "#{rope.identifier}") + climb_fields(rope, indv_rope_form) + "<br>".html_safe
        end
      end.join.html_safe
    end
  end

  def climb_fields(rope, form)
    #for each rope, if they already have Climb objects, show those
    if rope.climbs != []
      rope.climbs.collect do |climb|
        form.fields_for Element::Rope::Climb.new do |climb_form|
          climb_form.phone_field :number_of_climbs, {name: "preuse_inspection[preuse_inspection_takedown][ropes][#{rope.identifier}][#{climb.climbing_block}]"}
        end
      end.join.html_safe
    #otherwise, use new climb objects
    else
      4.times.collect do |i|
        form.fields_for Element::Rope::Climb.new do |climb_form|
          climb_form.phone_field :number_of_climbs, {name: "preuse_inspection[preuse_inspection_takedown][ropes][#{rope.identifier}][#{i+1}]"}
        end
      end.join.html_safe
    end
  end
end
