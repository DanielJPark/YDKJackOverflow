class Comment < ActiveRecord::Base
  validates :content, :user_id, :post_id, :post_type { presence: true }

  belongs_to :user, inverse_of: :comments
  belongs_to :post, polymorphic: true, inverse_of: :comments
end
