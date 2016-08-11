class Vote < ActiveRecord::Base
  belongs_to :user, inverse_of: :votes
  belongs_to :post, polymorphic: true, inverse_of: :votes
end
