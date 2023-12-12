class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre, :isbn, :available_copies, :copies_amount, :available, :copies_borrowed, :borrowed_due_dates
end
