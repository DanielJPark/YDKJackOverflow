class Category < ActiveRecord::Base
  # Remember to create a migration!
  has_many :questions, inverse_of: :category
end
