class Comment < ActiveRecord::Base
  belongs_to :user, inverse_of: :comments
  belongs_to :post, polymorphic: true, inverse_of: :comments
end
