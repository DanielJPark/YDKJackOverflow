class Answer < ActiveRecord::Base
  has_many :comments, as: :post
  has_many :votes, as: :post, foreign_key: :post_id
  belongs_to :user
  belongs_to :question
end
