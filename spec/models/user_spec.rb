require 'rails_helper'

RSpec.describe User, type: :model do

  let(:orkila) do
    Site.find_or_create_by(name: "Orkila")
  end

  let(:good_attrs) do
    {
      fullname: "BBT",
      email: "test@email.com",
      password: "p",
      role: "facilitator",
      site: orkila
    }
  end

  before do
    @good_user = User.create(good_attrs)
  end

  it "can create a new user with a name, email, nickname, and password" do
    expect(@good_user).to be_valid
  end

  it "won't create a user with a duplicate email" do
    user_copy = User.create(good_attrs)
    expect(user_copy).to_not be_valid
  end

  it 'must be created with a password' do
    no_pass = User.create(good_attrs.except(:password))
    expect(no_pass).not_to be_valid
  end
end
