# README
## Overview

This project is a code challenge for a position as Software Engineer at Ballast.
This is a Ruby on Rails application developed using ruby 3.2.2 and Rails 7.0.8

## Challenge
```
Technical Challenge: Building a Library Management System 

Objective:  

Develop a web application to manage a library's book inventory and user borrowings. 

Duration: 2 days 

Features: 

    Authentication and Authorization:

    Users should be able to register, log in, and log out.

    Two types of users: Librarian and Member.

    Only Librarian users should be able to add, edit, or delete books.

    Book Management: 

    Ability to add a new book with details like title, author, genre, ISBN, and total copies.

    Ability to edit and delete book details.

    Search functionality: Users should be able to search for a book by title, author, or genre.

    Borrowing and Returning: 

    Member users should be able to borrow a book if it's available. They can't borrow the same book multiple times.

    The system should track when a book was borrowed and when it's due (2 weeks from the borrowing date).
 
    Librarian users can mark a book as returned.

    Dashboard: 

    Librarian: A dashboard showing total books, total borrowed books, books due today, and a list of members with overdue books.

    Member: A dashboard showing books they've borrowed, their due dates, and any overdue books.

    API Endpoints: 

    Develop a RESTful API that allows CRUD operations for books and borrowings. 

    Ensure proper status codes and responses for each endpoint. 

    Frontend (Optional, but a bonus): 

    While the main focus is on Ruby on Rails, you can choose to integrate the backend with a frontend framework of your choice (React, Vue, etc.). The frontend should be responsive and user-friendly. 

Submission Guidelines: 

    Include a README with setup instructions and any other documentation you deem necessary. 

    The application should have seeded data / credentials for demo purposes.
```
## Setup

- Install Ruby 3.2.2 [using the preferred method(RVM was used in this project)](https://www.ruby-lang.org/en/documentation/installation/)
- Run `bundle install`, this will install all gems used for this project
- Run `rails db:setup`, this will setup the database, run the migrations and seed the database, there is no need for a standalone database for this since we are using SQLite3
- Run `bundle exec rspec` to make sure everything is working just fine

Thats all

## Usage

You can explore this API using this [postman collection](Ballast%20challenge.postman_collection.json). You should be able to import the collection using [this guide](https://learning.postman.com/docs/getting-started/importing-and-exporting/importing-data/), the default librarian and member credential are being store in the {{librarian_user}} and {{member_user}} with the password at {{common_password}} this are seeded with values from the [seeds file](db/seeds.rb) but can be updated for new values after using the `POST /{{user_type}}/sign_up`.

The application itself are not protected so any request can be done to the api to create member/librarian, and then use credentials to do operations, one way to secure is to use JWT using signed requests, with the `jwt` gem.

This app uses devise/devise-jwt for the authentication but in order to make it easier the session still enabled, if you want to force the usage of JWT, when doing a sign-in request use the Authorization header returned in the next requests.

## Reasoning behind a few choices

### Why Devise-JWT?
Devise are a very commonly used gem to handle authentication but in order to make it work with the api mode without too much fixed we need the JWT extension

### Why STI instead of a role based authorization ?
This was decided early on and for separating the users and handling the different endpoints/permissions

