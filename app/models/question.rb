class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :category
  belongs_to :selected_answer

  has_many :answers
  has_many :comments, as: :commentable


end
