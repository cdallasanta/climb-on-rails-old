# Climb On

Climb On is a web app for challenge course managers (CCM) to cut down on the tremendous amounts of paperwork they need to create and keep. The site's facilitators can complete their pre-use inspections online, seeing comments from past users, and log the number of uses each rope or cable receives. With higher levels of permissions, users can log periodic inspections, retire and replace ropes, and manage the instructions presented to the facilitators.

### Known bugs
- view past preuse, if there isn't one, should offer to create one
- empty comments
- updated_by for takedown not working yet

### Future Features
- "Make it look good"
- Implimenting Devise and ActiveAdmin engines
- replace omniauth-facebook with admin-created users (and allow the admin to do so in bulk via a spreadsheet)
- Adding more user data, such as their ropes portfolio (maybe leading to an automatic log of hours)
- Site contact receives emails with comments from inspections
- Replies to comments, such as one a CCM would leave on a repaired piece of gear
- Gear log


## Usage
To run the app locally, clone this repo. Run `bundle install` in your terminal, run the migrations using `rake db:migrate` and you can seed the database with dummy data by running `rake db:seed`. Since it uses the gem `omniauth-facebook,` you will need to create a `.env` file and add your facebook key and secret like so:

```ruby
# /climb-on-rails/.env
FACEBOOK_KEY = (your app id here)
FACEBOOK_SECRET = (your app secret here)
```

You can now run `rails server` in your terminal, and the app will be available at localhost:3000.

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/cdallasanta/ropes-sinatra. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## License
The gem is available as open source under the terms of the MIT License.

## Code of Conduct
Everyone interacting in the Rope Log's project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.
