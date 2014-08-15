class Supplier < User
  has_many :payments, foreign_key: :user_id
  include CustomerSupplier
end
