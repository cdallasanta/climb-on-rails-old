# Climb On

Climb On is a web app for challenge course managers (CCM) to cut down on the tremendous amounts of paperwork they need to create and keep. The site's facilitators can complete their pre-use inspections online, seeing comments from past users, and log the number of uses each rope or cable receives. With higher levels of permissions, users can log periodic inspections, retire and replace ropes, and manage the instructions presented to the facilitators.

### Future Features
- "Make it look good"
- Implimenting Devise and ActiveAdmin engines
- Adding more user data, such as their portfolio (maybe leading to an automatic log of hours)
- Replies to comments, such as one a CCM would leave on a repaired piece of gear
- Gear log


## Usage
To run the app locally, clone this repo. Run `bundle install` in your terminal, run the migrations using `rake db:migrate` and you can seed the database with dummy data by running `rake db:seed`. You can now run `rails server` in your terminal, and the app will be available at localhost:3000.

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/cdallasanta/ropes-sinatra. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## License
The gem is available as open source under the terms of the MIT License.

## Code of Conduct
Everyone interacting in the Rope Log's project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.
