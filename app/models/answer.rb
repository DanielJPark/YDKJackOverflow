class Answer < ActiveRecord::Base
  validates :content, :user_id, :question_id, { presence: true }

  has_many :comments, as: :post, inverse_of: :post
  has_many :votes, as: :post, inverse_of: :post
  belongs_to :user, inverse_of: :answers
  belongs_to :question, inverse_of: :answers
  has_one :correctly_answered_question, foreign_key: :selected_answer_id, class_name: "Question"

  def score
    self.votes.inject(0) { |v| v.value }
  end
end
