class Question < ActiveRecord::Base
  has_many :answers, inverse_of: :question
  has_many :comments, as: :post, inverse_of: :post
  has_many :votes, as: :post, foreign_key: :post_id, inverse_of: :post
  belongs_to :user, inverse_of: :questions
  belongs_to :category, inverse_of: :questions
  belongs_to :selected_answer, class_name: "Answer"

  def score
    self.votes.inject(0) { |sum, v| sum + v.value }
  end
end
