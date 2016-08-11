require 'spec_helper'

describe Answer, type: :model do
  it { should belong_to :user }
  it { should have_many :votes }
  it { should have_many :comments }
end