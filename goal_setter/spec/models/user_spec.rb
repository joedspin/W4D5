require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "uniqueness" do 
    before :each do
      create(:user)
    end 

    it { should validate_uniqueness_of(:session_token) }
    it { should validate_uniqueness_of(:username) }
  end 

  describe "User::find_by_credentials" do
    it "should find user by username, password" do
      user = create(:user)
      expect(User.find_by_credentials(user.username, user.password)).to eq(user)
    end
  end

  describe "#is_password?" do 
    it "should return true if password is correct" do
      user = create(:user)
      expect(user.is_password?("starwars")).to be(true)
    end
    it "should return false if password is incorrect" do
      user = create(:user)
      expect(user.is_password?("davidishot")).to be(false)
    end
  end

end