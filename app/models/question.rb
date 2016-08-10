class Question < ActiveRecord::Base
  has_many :answers
  has_many :comments, as: :post, foreign_key: :post_id
  has_many :votes, as: :post, foreign_key: :post_id
  belongs_to :user
  belongs_to :category
  has_one :selected_answer
end
