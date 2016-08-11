class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :category
  has_one :selected_answer

  has_many :answers
  has_many :comments, as: :post


end
