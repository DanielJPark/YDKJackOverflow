class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_one :user
  has_one :category
  has_one :selected_answer

  has_many :answers
  has_many :comments, as: :commentable


end
