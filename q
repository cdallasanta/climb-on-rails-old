
[1mFrom:[0m /mnt/c/Users/Chris/Documents/projects/climb-on-rails/app/controllers/users_controller.rb @ line 40 UsersController#check_owner_of_user:

    [1;34m39[0m: [32mdef[0m [1;34mcheck_owner_of_user[0m(user)
 => [1;34m40[0m:   binding.pry
    [1;34m41[0m:   [32mif[0m user != current_user
    [1;34m42[0m:     flash[[33m:alert[0m] = [31m[1;31m"[0m[31mYou must be logged in as that user to view their page[1;31m"[0m[31m[0m
    [1;34m43[0m:     redirect_to root_path
    [1;34m44[0m:   [32mend[0m
    [1;34m45[0m: [32mend[0m

