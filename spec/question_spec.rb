require 'spec_helper'

describe Question, type: :model do
  # it { should belong_to :user }
  it { should have_many :answers }
  it { should have_many :votes }
  it { should have_many :comments }
  # it { should belong_to :category }
end

describe "testing tests" do
  it { expect(true).to eq true }
end

