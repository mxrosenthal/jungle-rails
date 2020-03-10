require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "must be created with a password" do 
      @user = User.new(first_name: "Max", last_name: "Xam", email: "a@a.com", password: nil, password_confirmation: nil)
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "is not valid if passwords do not match" do 
      @user = User.new(first_name: "Max", last_name: "Xam", email: "a@a.com", password: "123456", password_confirmation: "TerryFox")
      expect(@user).to be_invalid
    end
    it "must be created with a password that matches the password_confirmation" do
      @user = User.new(first_name: "Max", last_name: "Xam", email: "a@a.com", password: "123456", password_confirmation: "123456")
      expect(@user.password).to eq(@user.password_confirmation)
    end
    it "only allows unique emails (not case sensitive)" do
      @user1 = User.new(first_name: "Max", last_name: "Xam", email: "a@a.com", password: "123456", password_confirmation: "123456")
      @user1.save
      @user2 = User.new(first_name: "Barry", last_name: "Jerry", email: "A@A.com", password: "123456", password_confirmation: "123456")
      expect(@user2).to be_invalid
         
    end
    it "must be created with an email" do 
      @user = User.new(first_name: "Max", last_name: "Xam", email: nil, password: "123456", password_confirmation: "123456")
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to contain_exactly("Email can't be blank")
    end
    it "must be created with a first name" do 
      @user = User.new(first_name: nil, last_name: "Xam", email: "a@a.com", password: "123456", password_confirmation: "123456")
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to contain_exactly("First name can't be blank")
    end
    it "must be created with a last name" do 
      @user = User.new(first_name: "Max", last_name: nil, email: "a@a.com", password: "123456", password_confirmation: "123456")
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to contain_exactly("Last name can't be blank")
    end
    it "Password must be at least 6 characters." do 
      @user = User.new(first_name: "Max", last_name: "Xam", email: "nil@crud.com", password: "12345", password_confirmation: "12345")
      expect(@user).to be_invalid
    end
  end

  describe ".authenticate_with_credentials" do
    it "should log a user in if email and password are correct" do
      @user = User.new(first_name: "Max", last_name: "Xam", email: "nil@crud.com", password: "123456", password_confirmation: "123456")
      @user.save
      expect(User.authenticate_with_credentials("nil@crud.com", "123456")).to be_truthy
    end
    it "should not log a user in if email and password are correct" do
      @user = User.new(first_name: "Max", last_name: "Xam", email: "nil@crud.com", password: "123456", password_confirmation: "123456")
      @user.save
      expect(User.authenticate_with_credentials("nil@crud.com", "abcdefg")).to be_falsey
    end
    it "should trim trailing and leading spaces" do
      @user = User.new(first_name: "Max", last_name: "Xam", email: "nil@crud.com", password: "123456", password_confirmation: "123456")
      @user.save
      expect(User.authenticate_with_credentials("   nil@crud.com", "123456")).to be_truthy
      expect(User.authenticate_with_credentials("   nil@crud.com   ", "123456")).to be_truthy
      expect(User.authenticate_with_credentials("nil@crud.com  ", "123456")).to be_truthy
    end
    it "should accept emails regardless of upper/lower case." do
      @user = User.new(first_name: "Max", last_name: "Xam", email: "nil@crud.com", password: "123456", password_confirmation: "123456")
      @user.save
      expect(User.authenticate_with_credentials("NIL@CRUD.com", "123456")).to be_truthy
      expect(User.authenticate_with_credentials("   nil@crud.COM   ", "123456")).to be_truthy
      expect(User.authenticate_with_credentials("nIl@crud.com  ", "123456")).to be_truthy
    end
  end
end
