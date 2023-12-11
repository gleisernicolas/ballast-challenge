# README

## Challenge
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