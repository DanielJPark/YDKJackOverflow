class Answer < ActiveRecord::Base
  has_many :comments, as: :commentable, foreign_key: :post_id
  has_many :votes, as: :votable, foreign_key: :post_id
  belongs_to :user
  belongs_to :question
end
