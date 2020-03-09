require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "must be created with a password" do 
      @user = User.new(first_name: "Max", last_name: "Xam", email: "a@a.com", password: nil, password_confirmation: nil)
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to contain_exactly("Password can't be blank")
    end
    it "is not valid if passwords do not match" do 
      @user = User.new(first_name: "Max", last_name: "Xam", email: "a@a.com", password: "123", password_confirmation: "1")
      expect(@user).to be_invalid
    end
    it "must be created with a password that matches the password_confirmation" do
      @user = User.new(first_name: "Max", last_name: "Xam", email: "a@a.com", password: "123", password_confirmation: "123")
      expect(@user.password).to eq(@user.password_confirmation)
    end
    it "only allows unique emails (not case sensitive)" do
      @user1 = User.new(first_name: "Max", last_name: "Xam", email: "a@a.com", password: "123", password_confirmation: "123")
      @user1.save
      @user2 = User.new(first_name: "Barry", last_name: "Jerry", email: "A@A.com", password: "123", password_confirmation: "123")
      expect(@user2).to be_invalid
         
    end
    it "must be created with an email" do 
      @user = User.new(first_name: "Max", last_name: "Xam", email: nil, password: "123", password_confirmation: "123")
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to contain_exactly("Email can't be blank")
    end
    it "must be created with a first name" do 
      @user = User.new(first_name: nil, last_name: "Xam", email: "a@a.com", password: "123", password_confirmation: "123")
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to contain_exactly("First name can't be blank")
    end
    it "must be created with a last name" do 
      @user = User.new(first_name: "Max", last_name: nil, email: "a@a.com", password: "123", password_confirmation: "123")
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to contain_exactly("Last name can't be blank")
    end
  end
end
