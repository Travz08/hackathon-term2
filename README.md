# Term 2 Hackathon - Pawesome
# Travis Kelekolio, James Marotta & Carmen Chung

## Task
We were tasked with creating an online store (with one seller, multiple products, and multiple customers) using Ruby on Rails within 1.5 days.

## Synopsis
Our online store is a web app for a dog rescue shelter that allows them to post the dogs available for adoption, including information such as name, breed, age (determined by calculating current year minus year of birth), gender, whether the dog has been neutered and/or vaccinated, adoption fee etc. Each dog has its own profile with detailed information.
A user can search key parameters when browsing the dogs available, including name, age, gender and breed. They can also login/sign up to save (i.e. favourite) the dogs they wish to view again. If there is a particular dog they are interested in adopting, they can message the rescue shelter via the website.
The rescue shelter can login as admin and see the messages that users have sent about particular dogs, as well as see which dogs have been favourited the most.

## Rails Conventions
We used Robucop as a code analysis tool.
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





Ruby conventions such as [insert] were followed.

## Feature development and use of Ruby gems / APIs
The following gems were used:
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
gem 'shrine'
# : For Windows users (sadface)
* gem 'wdm' (>= 0.1.0)
# For code analysis
* gem 'Rubocop', require: false
```
The following APIs were used:
[to be inserted]

## Design & Planning
We created user stories using Trello (available upon request, as we need to authorise viewers), and used DBdesigner to create an ERD [Travis to insert]. Wireframes of the design are found here [James to insert].

## Deployment
Our web application was deployed using Heroku, and can be found here [Travis to insert].

## Source Code Management

## Teamwork
Tasks were divided into various categories and sub-categories. To begin with, they were divided by back-end (Travis & James) and front-end (Carmen). From there, a list was made of all the sub-categories (such as users, puppies, and admin), and individual tasks were assigned to each team member. For example, Travis was responsible for implementing the messaging system; James was responsible for the search functionality; and Carmen was responsible for overall design and UX/UI.

All team members worked together in order to resolve issues (discussed below).

## Issues Encountered
The key issue encountered by the team involved using Git. An early mistake was the creation of multiple, unnecessary branches despite having a small, agile team. This was done because it was believed that each branch should reflect a category of work (i.e. design, admin, user, and puppies), as well as master. Furthermore, one of the branches was unable to merge with any of the others as the history of the branches was radically different, and Github would not allow a merge.

The solution was to create only one branch for each team member, and for that team member to constantly push to their branch, submit a pull request, and for all conflicts to be resolved and the work pushed to master, which would then be pulled by the other team members.
Other issues included [to be inserted].
