require 'rails_helper'

RSpec.describe Rope, type: :model do
  let(:tiger) do
    Element.find_or_create_by(
      name: "Crouching Tiger",
      site: Site.find_or_create_by(name: "Orkila")
    )
  end

  let(:good_attrs) do
    {
      primary_identifier: "Red",
      secondary_identifier: "black",
      element: tiger
    }
  end

  let(:no_primary) {good_attrs.except(:primary_identifier)}
  let(:no_secondary) {good_attrs.except(:secondary_identifier)}
  let(:no_element) {good_attrs.except(:element)}

  it 'can create a rope with good attrs' do
    good_rope = Rope.create(good_attrs)
    expect(good_rope).to be_valid
  end

  it 'must have a primary_identifier' do
    rope_no_primary = Rope.create(no_primary)
    expect(rope_no_primary).not_to be_valid
  end

  it 'secondary identifier is optional' do
    rope_no_secondary = Rope.create(no_secondary)
    expect(rope_no_secondary).to be_valid
  end

  it 'must be created with an element' do
    rope_no_element = Rope.create(no_element)
    expect(rope_no_element).not_to be_valid
  end
end
