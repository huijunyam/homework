require 'rails_helper'


describe User do
  subject(:user) do
    FactoryGirl.build(:user, username: "jack", password: "password1234")
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:moderated_subs) }


  it "creates a password digest from password given by user" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates session token" do
    expect(user.session_token).to_not be_nil
    end

  describe "#reset_session_token" do
    it "set new session token" do
      old_session_token = user.session_token
      user.reset_session_token
      expect(user.session_token).to_not eq(old_session_token)
    end
  end

  describe "#is_password?" do
    it "verifies a password" do
      expect(user.is_password?("password1234")).to be true
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }
    it "return the user if it found the credentials" do
      expect(User.find_by_credentials("jack", "password1234")).to eq(user)
    end

    it "return nil if it did not find the credentials" do
      expect(User.find_by_credentials("jackie", "password")).to eq(nil)
    end
  end

end
