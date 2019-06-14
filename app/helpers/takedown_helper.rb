module TakedownHelper

  def rope_and_climb_fields(ff, takedown)
    ff.fields_for :ropes do |rope_form|
      rope_form.label(rope_form.object.identifier) + climb_fields(rope_form.object, rope_form) + "<br>".html_safe
    end
  end

  def climb_fields(rope, form)
    #for each rope, if they already have Climb objects, show those
    if rope.climbs == []
      4.times { rope.climbs.new }
    end
    form.fields_for :climbs do |climb_form|
      climb_form.phone_field :number_of_climbs
    end
  end
end
