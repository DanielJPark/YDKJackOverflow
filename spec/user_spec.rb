require_relative "spec_helper"

describe User, type: :model do
  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should validate_presence_of :hashed_password }
  it { should have_many :questions }
  it { should have_many :answers }
  it { should have_many :comments }
  it { should have_many :votes }
end 