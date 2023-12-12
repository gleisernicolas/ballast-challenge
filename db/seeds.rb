# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

book_1 = Book.create(
  title: "The Hobbit",
  author: "J.R.R. Tolkien",
  genre: "Fantasy",
  isbn: "9780547928227",
  copies_amount: 5
)

book_2 = Book.create(
  title: "The Fellowship of the Ring",
  author: "J.R.R. Tolkien",
  genre: "Fantasy",
  isbn: "9780547928210",
  copies_amount: 5
)

book_3 = Book.create(
  title: "99 Bottles of OOP",
  author: "Sandi Metz",
  genre: "Programming",
  isbn: "9781680501224",
  copies_amount: 1
)

member_1 = Member.create(
  email: "member1@email.com",
  password: "password",
  password_confirmation: "password"
)

member_2 = Member.create(
  email: "member2@email.com",
  password: "password",
  password_confirmation: "password"
)

loan_1 = member_1.loans.new(
  book: book_1,
  due_at: Date.today - 1.day,
  checked_out_at: Date.today - 2.days
)

# This is to bypass the validation that prevent due_at from being in the past in order to have a loan that is overdue for testing
loan_1.save(validate: false)

loan_2 = member_2.loans.create(
  book: book_2,
  due_at: Date.today + 2.weeks,
  checked_out_at: Date.today - 1.week
)

librarian = Librarian.create(
  email: "librarian@user.com",
  password: "password",
  password_confirmation: "password"
)