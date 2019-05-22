require 'rails_helper'

# now test models are not persisting between tests, but at least they are not
# persisting after it

RSpec.describe User, type: :model do

  let(:orkila) do
    Site.find_or_create_by(name: "Orkila")
  end

  let(:good_attrs) do
    {
      fullname: "BBT",
      username: "BBT",
      password: "p",
      role: "facilitator",
      site: orkila
    }
  end

  it "can create a new user" do
    good_user = User.create(good_attrs)
    expect(good_user).to be_valid
  end

  it "won't create a duplicate user" do
    user_copy = User.create(good_attrs)
    expect(user_copy).to_not be_valid
  end
end
