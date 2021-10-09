# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

KanbanColumn.destroy_all
Kanban.destroy_all
Task.destroy_all
User.destroy_all
Wiki.destroy_all
Note.destroy_all
Notification.destroy_all
Message.destroy_all
Chatroom.destroy_all

user1 = User.create(
  first_name: "Nick",
  last_name: "Ang",
  position: "Project_manager",
  phone: "0430102545",
  gender: "Male",
  email: "nick@pnp.com",
  password: "secret",
  admin: true,
  salary: 100000,
  pay_cycle: "Weekly",
  birthdate: Date.new(1993, 7, 27),
  tfn: 333888999,
  bank_account: 17339022,
  bank_bsb: 860078,
  last_pay: DateTime.now() - 6,
)

user2 = User.create(
  first_name: "Fisher",
  last_name: "Lim",
  position: "Employee",
  phone: "0410142546",
  gender: "Male",
  email: "fisher@pnp.com",
  password: "secret",
  admin: false,
  salary: 80000,
  pay_cycle: "Fortnightly",
  birthdate: DateTime.new(1993, 7, 27, 4),
  tfn: 444888999,
  bank_account: 18439022,
  bank_bsb: 120078,
  last_pay: DateTime.now() - 15,
)

user3 = User.create(
  first_name: "Setare",
  last_name: "Akbare",
  position: "Administrator",
  phone: "0455162546",
  gender: "Male",
  email: "setare@pnp.com",
  password: "secret",
  admin: false,
  salary: 120000,
  pay_cycle: "Monthly",
  birthdate: DateTime.new(1993, 7, 27, 4),
  tfn: 111888999,
  bank_account: 30439022,
  bank_bsb: 2220078,
  last_pay: DateTime.now,
)

project1 = Project.create(
  name: "Develop PNP App",
  created_by: user1,
  progress: 90,
  start_date: DateTime.now() - 30,
  end_date: DateTime.now() + 10,
  status: "in_progress",
)

project2 = Project.create(
  name: "Develop Google App",
  created_by: user1,
  progress: 100,
  status: "completed",
  start_date: DateTime.now() - 100,
  end_date: DateTime.now() - 50,
)

ProjectAssign.create(
  user: user1,
  project: project1,
)
ProjectAssign.create(
  user: user2,
  project: project1,
)

ProjectAssign.create(
  user: user3,
  project: project1,
)

ProjectAssign.create(
  user: user1,
  project: project2,
)

my_kanban = Kanban.create(
  project: project1,
)

backlog = KanbanColumn.create(
  name: "not_started",
  kanban: my_kanban,
)

todo = KanbanColumn.create(
  name: "in_progress",
  kanban: my_kanban,
)

completed = KanbanColumn.create(
  name: "completed",
  kanban: my_kanban,
)

my_kanban2 = Kanban.create(
  project: project2,
)

backlog2 = KanbanColumn.create(
  name: "not_started",
  kanban: my_kanban2,
)

todo2 = KanbanColumn.create(
  name: "in_progress",
  kanban: my_kanban2,
)

completed2 = KanbanColumn.create(
  name: "completed",
  kanban: my_kanban2,
)

task1 = Task.create(duration: 1, name: "Push to Heroku", position: 0, status: "not_started", kanban_column: backlog, priority: "low", due_date: DateTime.now() + 1)
TaskAssign.create(user: user1, task: task1)
task2 = Task.create(duration: 10, name: "Bug testing", position: 0, status: "in_progress", kanban_column: todo, priority: "medium", due_date: DateTime.now() + 3)
TaskAssign.create(user: user2, task: task2)
task3 = Task.create(duration: 1000, name: "Develop program", position: 0, status: "completed", kanban_column: completed, priority: "high", due_date: DateTime.now() - 10)
TaskAssign.create(user: user2, task: task3)
TaskAssign.create(user: user1, task: task3)
task4 = Task.create(duration: 15, name: "Finalize Documentation", position: 1, status: "not_started", kanban_column: backlog, priority: "medium", due_date: DateTime.now() - 3)
TaskAssign.create(user: user2, task: task4)
task5 = Task.create(duration: 5000, name: "Review and Deploy", position: 1, status: "completed", kanban_column: completed2, priority: "high", due_date: DateTime.new(2021, 8, 18))
TaskAssign.create(user: user1, task: task5)
task6 = Task.create(duration: 10, name: "Tally hours worked", position: 1, status: "completed", kanban_column: completed2, priority: "high", due_date: DateTime.new(2021, 8, 18))
TaskAssign.create(user: user3, task: task6)
Note.create(title: "Check if HR paid", description: "Message Setare", user: user2, color: "red")
Note.create(title: "Buy Milk Tonight", description: "2 L Brownes", user: user2, color: "green")
Note.create(title: "Mums birthday in two weeks", description: "", user: user2, color: "yellow")
chat = Chatroom.create(name: "HR and Local Admin Chatroom")
ChatroomAssign.create(user: user1, chatroom: chat)
ChatroomAssign.create(user: user3, chatroom: chat)
Wiki.create(author: "Nick", user: user1, title: "Sortable JS", description: "https://medium.com/le-wagon-tokyo/tutorial-build-a-drag-n-drop-kanban-board-on-rails-with-sortablejs-c6affa5642cf")
Wiki.create(author: "Nick", user: user1, title: "Authy", description: "2FA in Rails 4 with Devise, Authy and Puppies


Passwords aren’t enough anymore. Keeping user data safe is hard enough without users themselves choosing the worst passwords in the world. Yes, “123456” has topped the list of most commonly used password of the year…again.

Two-factor authentication keeps your users’ accounts secure by requiring a second factor of authentication, something a user has (their phone) as well as something they know (their password). Two-factor authentication can be hard to implement and even harder to secure properly. Authy is a Twilio service that provides two-factor authentication as an API, making it easy to secure our users’ accounts.

Your password needs to contain a capital letter, a number, an emoji, a plot, a protagonist with some character development, and a twist end.
— Jake Lawrence (@TheTimeCowboy) January 5, 2013
In this post I want to show you how to implement two-factor authentication using Authy in your Rails 4 apps using Devise. We already have a tutorial that walks you through adding two-factor authentication to a Rails application, but as Devise is the most popular authentication framework for Rails I thought it would be unwise to leave it out. In this post, we’ll take a basic Rails application, add user accounts with Devise and make them extra secure by enabling two-factor authentication.

The tools
To put this application together we’re going to need a couple of things:

a Twilio account (sign up for free here)
Ruby installed (I’m using the current latest, 2.3.0, but any version that runs Rails will work)
Bundler, so we can install our dependencies.
And that’s it. Let’s get going.

Something to protect
So that we don’t have to build a whole Rails application up from scratch I have created a starter application for us. It’s called Super Secret Puppies and is a simple app that allows users to log in and look at pictures of puppies. All we need to do is build that login functionality.

Let’s get the app up and running. You can clone the repository, install the dependencies and start the app with the following commands:

$ git clone https://github.com/philnash/super-secret-puppies.git
$ cd super-secret-puppies
$ bundle install
$ bundle exec rails server
Navigate to http://localhost:3000 and you’ll see the home page.

A screenshot of the Super Secret Puppies home page

You’ll find you can click on the call to action to see the puppies and you’ll be directed to a page of puppy pictures. I’ll give you a minute while you enjoy that.

Ok, it’s just one puppy, my one, but she’s called Ruby so I’m pretty happy that this is on topic for today.

For the rest of this post we’re going to implement user accounts with two-factor authentication to restrict access to this page to our registered users.

Implementing user accounts with Devise
We’ll start by adding Devise to our Gemfile. Add the following line after all the regular gems (that is, not inside any of the groups).

# Gemfile
gem 'devise'
Bundle the new gem into the project.

$ bundle install
Run the Devise generators and migrate the database.

$ bundle exec rails g devise:install
$ bundle exec rails g devise User
$ bundle exec rake db:migrate
This installs Devise and then creates a User model that we will use to sign up to our application with.

Let’s protect our puppies controller from non-logged in users. Open up app/controllers/puppies_controller.rb and add the following before_action at the top of the file:

# app/controllers/puppies_controller.rb
class PuppiesController < ApplicationController
  before_action :authenticate_user!

  def index
  end
end
This is a Devise helper that ensures there is a logged in user in the session. If there is no logged in user then the response will be a redirect to the login page.

I like to make one other change to the default Devise setup. That is to allow logging out by GET request. Open up config/initializers/devise.rb and change the line

# config/initializers/devise.rb
  config.sign_out_via = :delete
to

# config/initializers/devise.rb
  config.sign_out_via = :get
Restart the application and load up the home page again. You’ll find links to sign up and log in at the top right (I snuck those into the base app to save us writing HTML). Try navigating to the page of puppies. You’re now redirected to the login page. Hit the link to sign up, enter your email and a password, submit the form and you’re signed up and looking at a page of puppy pictures. Lovely, but we can make it more secure. Let’s get Authy involved and add two-factor authentication to this experience.

Adding two-factor authentication to Devise with Authy
The first thing we need to do is install the Devise-Authy gem that will handle most of the integration. Add another line to your Gemfile, below the Devise gem we added earlier.

# Gemfile
gem 'devise'
gem 'devise-authy'
Bundle the new dependency.

$ bundle install
Create an initializer for Authy in config/initializers.

$ touch config/initializers/authy.rb
Add the following code to the initializer.

You’ll notice we need an API key for Authy. You can get this from your Twilio account portal. Click the link to access the Authy dashboard.

If you don’t already have an Authy account, this will set one up for you. You will need to verify your email address and set up two-factor authentication. Then you can create an application with Authy and this will give you your API key.

Click 'Access Authy Dashboard' go through the sign up procedure for Authy by enabling two factor authentication and then create a new application. Name the application whatever you like and skip the next two screens, then you will find your API Key.

If you already have an Authy account, click “New application” at the bottom of your dashboard menu and you will go through the same process.

Now you have your API key, copy config/env.yml.example to config/env.yml and fill in the key.

# config/env.yml
development:
  AUTHY_API_KEY: 'YOUR_AUTHY_API_KEY_HERE'
We��re using a gem called envyable to set the API key in your application’s environment. It’s all set up for you, but if you’re interested in this setup more, I wrote about environments and envyable last year.

Now we���re ready to run our Devise Authy install script. On the command line enter:

$ rails g devise_authy:install
$ rails g devise_authy User
$ rake db:migrate
This installs the Devise Authy plugin and updates the User model to use two factor authentication if it is enabled for the account. Let’s enable this for our user that we created earlier now.

Restart your server and visit this page: http://localhost:3000/users/enable_authy. Fill in your country and your mobile phone number and you will get an SMS with a 7 digit token. Or, if you are already a user of the Authy app, you will receive a push notification adding the Super Secret Puppies app to your account and showing you the token (though you can force the token to arrive by SMS if you need). Submit the token to the form in the puppies app and two-factor authentication will be enabled on your account.

You can test this by logging out with the link in the top right of the page and then logging in again. You will be asked once more for a token which you should receive by SMS or application and once you enter the token you will be logged in.

This is an animation showing the process of enabling two factor authentication and then signing out and back in again and going through the two factor authentication process.

Two-Factor Authentication in just a few lines of code
Since we were using Devise, adding two-factor authentication using Authy was pretty straightforward. All we had to do was add an initializer for Authy, enter our API key, run an install command and migrate the database.

If you didn’t follow along with the code, but you want to see the finished application, you can check out the complete branch in the GitHub repository.

If you want to customize your application a bit more there are a few options. You can edit the views, set up custom redirects and add internationalized messages throughout the flow. If you’re not using Devise, or are interested in how it works, check out the tutorial on securing your user accounts using just Authy and Rails.

If you’ve got any questions about two-factor authentication or using Authy, please reach out to me on Twitter at @philnash.

**Okay, okay, no-one needs to keep pictures of puppies safe. Everyone wants to show off pictures of puppies, why else do you think I’d use them as an example in a blog post? Hope you enjoyed them!

This post originally appeared on the Twilio blog")
