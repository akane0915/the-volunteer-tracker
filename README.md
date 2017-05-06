# _The Volunteer Tracker_

#### _A web application to allow users to track volunteers working on projects.  The application allows users to store multiple projects and multiple volunteers for each project.  Each volunteer can only work on one project.   May 5, 2017_

#### By _**Asia Kane**_

## Description

This application is intended for a company or organization to use internally.  Its purpose is to allow an employee (most likely an employee who oversees all projects for the company), to track projects and volunteers working on each project.  The application can store multiple projects and multiple volunteers, but each volunteer can only work on one project at a time (one-to-many) relationship.

The application contains two database tables: volunteers and projects. The homepage of the application lists all projects and includes a form to add a project.  When a project is clicked, it leads to a page with the project's volunteers.  Users are able to update and delete a project or a user after they have been created via CRUD functionality.  This applications also uses RESTFUL routing.

### Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

Ruby
Bundler

## Specifications
| Behavior |  Input   |  Output  |
|----------|:--------:|:--------:|
|Program will allow user to input a project on the homepage|||
|Program will allow user to input a volunteer to a specific project (via dropdown) on the homepage|||
|Program will allow user to view all projects on the homepage and click on a project to be taken to the project details page|||
|On the project details page, program will display the volunteers who are working on that project|||
|On a project edit page, program will allow users to update a project's details or delete a project entirely|||


## Setup/Installation Requirements
           _
*_Set up a production database and a development database in SQL (see instructions below)_
* _In another terminal window, clone this repository to your machine and navigate to the file path in your terminal._
* _Run $bundle_
* _Run $ruby app.rb_
* _Type localhost:4567 in a browser window to view application_
* _If you would like to make changes, open files in text editor of your choice_
* _Make changes as desired_
* _Make frequent commits with detailed comments_
* _Submit changes as pull request to Asia at akane0915 on Github_

## Database Setup Instructions

* _If Postgres is not installed on your computer, follow these instructions https://www.learnhowtoprogram.com/ruby/ruby-database-basics/installing-postgres-7fb0cff7-a0f5-4b61-a0db-8a928b9f67ef_
* _run $postgres in your terminal window and leave it running_
* _In another terminal window, run $psql_
* _Type the following:_

* _CREATE DATABASE volunteer_tracker;_
* _\c volunteer_tracker_
* _CREATE TABLE projects (id serial PRIMARY KEY, title varchar);_
* _CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, hours int, project_id int);_
* _CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;_

## Known Bugs
_N/A_

## Support and contact details
_I encourage you to update/make suggestions/refactor this code as you see fit. I am always open to improvement! Please contact Asia Kane at asialkane@gmail.com with questions._

## Technologies Used
* Ruby
* Sinatra
* SQL Relational Database Management System
* Postgres Database Management System
* Psql
* Capybara Integration Testing
* Rspec Gem
* Pg Gem
* HTML
* CSS
* Bootstrap https://getbootstrap.com/
* ES6
* Jquery https://jquery.com/


### License
*This software is licensed under the MIT license*
Copyright © 2017 **Asia Kane**
