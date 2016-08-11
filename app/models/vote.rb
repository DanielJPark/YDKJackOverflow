class Vote < ActiveRecord::Base
  validates :value, :user_id, :post_id, :post_type, { presence: true }

  belongs_to :user, inverse_of: :votes
  belongs_to :post, polymorphic: true, inverse_of: :votes
end
