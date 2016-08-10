require_relative "../spec_helper"

describe User do
  describe 'associations' do
    before(:each) do
      @user = User.create!(username: "pupsnstuff", email: "kmbradshaw@ymail.com", hashed_password: "1234aslkdfaguq394rvlkj")
    end
  describe User do
    it { should validate_presence_of :username }
  end

  describe User do 
    it { should validate_presence_of :email }
  end

  describe User do 
    it { should validate_presence_of :email }
  end 
end
end