class MemberBookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre, :isbn, :available_copies
end