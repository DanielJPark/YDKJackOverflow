class Answer < ActiveRecord::Base
  has_many :comments
  has_many :votes, as: :answer
  belongs_to :user, as: :answer
  belongs_to :question
end
