require 'bcrypt'

class User < ActiveRecord::Base
	validates :email, :username, :hashed_password, { presence: true }
	validates :email, :username, { uniqueness: true }

	has_many :questions, :answers, :comments, :votes

	def password
  	@password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(password)
    self.password == password
  end
end
