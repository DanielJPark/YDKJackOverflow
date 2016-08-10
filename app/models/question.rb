class Question < ActiveRecord::Base
  has_many :answers
  has_many :comments, as: :question
  has_many :votes, as: :question
  belongs_to :user
  belongs_to :category
end
