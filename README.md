= Help Me Web Server (API only)

This project contains the web server and WEB API. It's the monolith that control
the application. The app provides following services:

== API Features
Register User (User Account Setup)
Authenticate User (User Personalisation)
Post Create/Update/Delete/Show (Product/item sharing which includes image upload as well)
Nearby Places based on current user location (Google Maps API integration)
Places Registration/Restriction (only allow places which are registered in the app)

Further reading links below.

== Dependencies
This project requires:

* Ruby 2.5.3
* Rails 5.2.1
* PostgreSQL 9.4.x
* Unix Based OS (Linux or MacOS) *Windows is not supported.*
* ImageMagick
* Git client
* GoogleMaps API KEY

For deployment / database management:
* Heroku CLI


== Running

To run the server execute the file devserver running the command:
```
rails server
```

== Installation Guide

If it's your first time using rails, please read below on the "Further Reading" section.
You will find tutorials and more detailed ways to start with Rails.

After all the dependencies have been installed:

1) Clone the repository:

```
git clone https://github.com/ittsel-ali/helpme-API.git helpme-API
cd helpme-API
```

2) Setup the environment.

```
bundle install
```

3) Depending on how you setup PostgreSQL you may have to enter the database credentials on the file:

/config/database.yml
First you gotta setup the database. So run this command inside the project folder:

```
rake db:create
rake db:migrate
```

== Testing
To run the automated tests use the command:

```
rake test
```

= Further Reading (Reference & Tutorials)
== Ruby / Rails
Rails is a web development framework for the ruby programming language. You can learn
both separately but nothing stops you to start with rails and then assimilate some
advanced ruby concepts later.

=== Interactive Ruby tutorial
If you've never touched ruby before, you should start here:

http://tryruby.org/


=== Rails for Zombies tutorial
This tutorial is a bit outdated because it uses Rails 3 instead of 4. But it's  interactive and you
quickly see some of the powerful rails features.

http://railsforzombies.org/

=== Rails Guide (The Must Read)

I'm always reading this guide. Every time I don't remember how to do something.
It explains very well, on a high level, almost every feature and tool of the framework.
If you can't understand it, you should better read the book or a more detailed tutorial.

But here we go:

* {The guide}[http://guides.rubyonrails.org/]

* {The book}[https://www.railstutorial.org/book]**, if you like going further.
We recommend you reading it. It's not mandatory! But it can help you a lot.
We don't follow every practice suggested there, but it's a very good book, and
the official starting point. It not only cover rails, but most of the web development theory.

We suggest you to read all the topics at some point. But since there's a lot to read,
you can do it as you explore the app and new challenges appear to you.

This are the most important ones that you can read before you start.

==== Start Here
{Getting started with rails}[http://guides.rubyonrails.org/getting_started.html]
Everything you need to know to install Rails and create your first application.

==== Then master the M from MVC
{Active Record Basics}[http://guides.rubyonrails.org/active_record_basics.html]
This guide will get you started with models, persistence to database and the Active Record pattern and library.

{Active Record Migrations}[http://guides.rubyonrails.org/active_record_migrations.html]
This guide covers how you can use Active Record migrations to alter your database in a structured and organized manner.

{Active Record Validations}[http://guides.rubyonrails.org/active_record_validations.html]
This guide covers how you can use Active Record validations

{Active Record Associations}[http://guides.rubyonrails.org/association_basics.html]
This guide covers all the associations provided by Active Record.

{Active Record Query Interface}[http://guides.rubyonrails.org/active_record_querying.html]
This guide covers the database query interface provided by Active Record.


==== Understand the basics about **V**iew and **C**ontrollers
{Layouts and Rendering in Rails}[http://guides.rubyonrails.org/layouts_and_rendering.html]
This guide covers the basic layout features of Action Controller and Action View, including rendering and redirecting, using content_for blocks, and working with partials.

{Action View Form Helpers}[http://guides.rubyonrails.org/form_helpers.html]
Guide to using built-in Form helpers.

==== More about  **C**ontrollers
{Action Controller Overview}[http://guides.rubyonrails.org/action_controller_overview.html]
This guide covers how controllers work and how they fit into the request cycle in your application. It includes sessions, filters, and cookies, data streaming, and dealing with exceptions raised by a request, among other topics.

{Rails Routing from the Outside In}[http://guides.rubyonrails.org/routing.html]
This guide covers the user-facing features of Rails routing. If you want to understand how to use routing in your own Rails applications, start here.

==== Digging Deeper
{Action Mailer Basics}[http://guides.rubyonrails.org/action_mailer_basics.html]
This guide describes how to use Action Mailer to send and receive emails.

{Active Job Basics}[http://guides.rubyonrails.org/active_job_basics.html]
This guide provides you with all you need to get started in creating, enqueueing and executing background jobs.

{Testing Rails Applications}[http://guides.rubyonrails.org/testing.html]
This is a rather comprehensive guide to doing both unit and functional tests in Rails. It covers everything from 'What is a test?' to the testing APIs. Enjoy.

{Securing Rails Applications}[http://guides.rubyonrails.org/security.html]
This guide describes common security problems in web applications and how to avoid them with Rails.

{Debugging Rails Applications}[http://guides.rubyonrails.org/debugging_rails_applications.html]
This guide describes how to debug Rails applications. It covers the different ways of achieving this and how to understand what is happening "behind the scenes" of your code.
