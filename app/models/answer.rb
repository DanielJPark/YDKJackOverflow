class Answer < ActiveRecord::Base
  has_many :comments, as: :post, inverse_of: :post
  has_many :votes, as: :post, inverse_of: :post
  belongs_to :user, inverse_of: :answers
  belongs_to :question, inverse_of: :answers

  def score
    self.votes.inject(0) { |v| v.value }
  end
end
