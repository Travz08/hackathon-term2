# Term 2 Hackathon - Pawesome
# Travis Kelekolio, James Marotta & Carmen Chung

## Task
We were tasked with creating an online store (with one seller, multiple products, and multiple customers) using Ruby on Rails within 1.5 days.

## Synopsis
Our online store is a web app for a dog rescue shelter that allows them to post the dogs available for adoption, including information such as name, breed, age (determined by calculating current year minus year of birth), gender, whether the dog has been neutered and/or vaccinated, adoption fee etc. Each dog has its own profile with detailed information.

A user can search key parameters when browsing the dogs available, including name, age, gender and breed. They can also login/sign up to save (i.e. favourite) the dogs they wish to view again. If there is a particular dog they are interested in adopting, they can message the rescue shelter via the website.

The rescue shelter can login as admin and see the messages that users have sent about particular dogs, as well as see which dogs have been favourited the most. Admin access is available upon request.

## Configuration and Setup - Rails conventions
We used Robucop as a code analysis tool. and Guard gem with live-reload for speedier refreshing
To add Rubocop gem

```
$ gem install rubocop
```
This can be quite a daunting gem if done out of the blue, we initially got 229 offences.

if you run with -a you can utilise the autocorrect from rubocop but it is experimental.

Running with -a got us down to 90 offences
You can then run
```
$ rubocop --auto-gen-config
```
and this will create .rubocop_todo.yml file which will help you config your robocop.

 then run
```
$ rubocop --config .rubocop_todo.yml
```
and this will run the tests in your todo, they are all defaulted to false, and you can turn them on one by one to allow for easier management of violations.

now make a blank file in your rails base directory
```
$ touch .rubocop.yml
```

Add the line
```
inherit_from: .rubocop_todo.yml
```
to the top of your .rubocop.yml file.


The process is then to run
```
$ rubocop
```
and it will list errors, fix them, then clear that section of rubocop.yml and then enable the next section.
continue until you have none left and integrate this into your regular test suite.

  The TODO file then becomes exceptions in your code base that are very close to the Rubocop minimums that raises errors and you can adjust

  Main problems we had was a lines too long, methods too long and blocks too long. For juniors this will improve as we get better at using less code to do more. With more efficient methods.

## guard and guard-livereload

Make sure you have guard installed follow instructions here : https://github.com/guard/guard

Instructions are summarised here for you:

Add Guard (and any other dependencies) to a Gemfile in your project’s root:
```
group :development do
  gem 'guard'
end
```
then install it by running Bundler:
```
$ bundle
```
Generate an empty Guardfile with:
```
$ bundle exec guard init
```

for guard live reload

Install the gem:
```
$ gem install guard-livereload
```
Add it to your Gemfile (inside development group):
```
group :development do
  gem 'guard-livereload', '~> 2.5', require: false
end
```
Add guard definition to your Guardfile by running this command:
```
$ guard init livereload
```  

You will need the chrome extention for live reload, which is found here: https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei

## Feature development and use of Ruby gems / APIs
The following gems were used: (this whole section can be copied to your gemfile)
```
# For Sign Up / Login / Logout
gem	'Devise' (~> 4.2)
# For changing alerts/success messages to pop ups
gem 'toastr-rails' (~> 1.0)
# For use with toastr-rails
gem 'jquery-rails'
# For setting location of the animal shelter
gem 'geocoder'
# For CSS styling
gem 'bootstrap' (~> 4.0.0.beta)
# For image uploading (for dog pictures)
gem 'shrine' & gem 'shrine-cloudinary'
# : For Windows users (sadface)
gem 'wdm' (>= 0.1.0)

group :development do, :test do
  # live reload of page for speedy testing
  gem 'guard-livereload', '~> 2.5', require: false
  # For code analysis
  gem 'Rubocop', require: false
end


```

now run

```
$ bundle

```

The following APIs were used:
Google maps API on the Contact page.

## Image optimiser
We used optimizilla.com to make sure all our images were as small as possible.

## Design & Planning
We created the following user stories using Trello.

![alt text](https://user-images.githubusercontent.com/30306087/31857425-fa6491e0-b729-11e7-9ac6-2b3ab51519da.png)

We used DBdesigner to create the below ERD:

![alt text](https://user-images.githubusercontent.com/30306087/31857436-55a45676-b72a-11e7-97c9-bd9c1ae5a56b.png)

Wireframes of the design are found here:
https://www.figma.com/file/V8bdWj5CHC5O9nt57Jeox3Uo/Pawsome

## Deployment
Our web application was deployed using Heroku, and can be found here: http://pawesome.herokuapp.com/. Admin access (to add, edit and delete available dogs) is available upon request.

## Source Code Management

A development environment was created for ensuring our team's MailGun username, password and domain are kept secret on Github.

## Issues Encountered

### Git
The key issue encountered by the team involved using Git. An early mistake was the creation of multiple, unnecessary branches despite having a small team. This was done because it was believed that each branch should reflect a category of work (i.e. design, admin, user, and puppies), as well as master. Furthermore, one of the branches was unable to merge with any of the others as the history of the branches was radically different, and Github would not allow a merge.

The solution was to create only one branch for each team member, and for that team member to constantly push to their branch, submit a pull request, and for all conflicts to be resolved and the work pushed to master, which would then be pulled by the other team members.

Another issue we encountered was the uploading of images when deployed to heroku. In development, images were being stored in files when uploaded locally, whereas when deployed images needed a cloud to be stored into.

The solution to this was to use the cloud based image management gem 'shrine-cloudinary'. This enabled us to upload, store, manage, manipulate and deliver images to our site.

We also originally wanted to utilise the gem 'geocoder' to display a map locating our adoption center. The gem, however, required a form to be filled out in order to retrieve the latitude and longitude values.

The solution to this was to manually input the values within the associated controller.

## Postgres vs Sqlite3
A fun new challenge we found right before the deadline, is that sqlite3 will let you search against booleans and integers using the same params as a regular string search. However, when we swapped to PG for heroku deployment, our entire search function errored out with each search, and with only cryptic messages to help us debunk the problems. Trial and error proved best value!

### Favourites
Originally we sought to complete this by making a new controller that would receive a method - 'favourite or unfavorite" - in the view, which would be sent with a button. This was based on a stack overflow tutorial, which proved problematic. While the routes where correct, it wouldn't accept the button calls.

We instead resorted to removing those and implementing a similar join table which checks a boolean against the button to see if something is true or not.

## Teamwork
Tasks were divided into various categories and sub-categories. To begin with, they were divided by back-end (Travis & James) and front-end (Carmen). From there, a list was made of all the sub-categories (such as users, puppies, and admin), and individual tasks were assigned to each team member. For example, Travis was responsible for implementing the mailing system; James was responsible for the search functionality; and Carmen was responsible for overall design and UX/UI.

All team members worked together in order to resolve the issues above.
