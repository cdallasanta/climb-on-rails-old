require './config/environment'

# tests are not currently working, objects are persisting between tests

# describe 'User' do
#   let(:good_attrs) do
#     {
#       fullname: "Billy Bob Thorton",
#       username: "BBT",
#       password: "y'all",
#       role: "facilitator"
#     }
#   end
#
#   before do
#     @good_user = User.create(good_attrs)
#   end
#
#   it 'can instantiate a user with good attributes' do
#     expect(@good_user).to be_valid
#   end
#
#   it 'has a unique username' do
#     copy_name = User.create(good_attrs)
#     expect(copy_name).not_to be_valid
#   end
# end
