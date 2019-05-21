require './config/environment'

describe 'User' do
  let(:good_attrs) do
    {
      fullname: "Billy Bob Thorton",
      username: "BBT",
      password: "y'all",
      role: "facilitator"
    }
  end

  it 'can instantiate a user with good attributes' do
    good_user = User.create(good_attrs)
    expect(good_user).to be_valid
  end

  it 'has a unique username' do
    copy_name = User.create(good_attrs)
    expect(copy_name).to_not be_valid
  end
end
