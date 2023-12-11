class Member < User
  has_many :loans, foreign_key: :user_id, dependent: :restrict_with_error
end