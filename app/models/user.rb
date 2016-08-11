require 'bcrypt'

class User < ActiveRecord::Base
	validates :email, :username, :hashed_password, { presence: true }
	validates :email, :username, { uniqueness: true, presence: true }

	has_many :questions, inverse_of: :user
  has_many :answers, inverse_of: :user
  has_many :comments, inverse_of: :user
  has_many :votes, inverse_of: :user


  include BCrypt
  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(password)
    self.password == password
  end
end
