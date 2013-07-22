require 'spec_helper'

describe User do 
  
  before {
      subject.email = "user@example.com"
  }

  context "factory" do
    it "is valid" do
      create(:user)
    end
    it "is able to generate multiple items" do
      2.times do
        create(:user)  
      end
    end
  end
  
  context "validations" do
    describe "the subject" do
      it { should be_valid }  
    end
    
    describe "email address" do
  
      it "should require an email address" do
        subject.email = ""
        subject.should_not be_valid
      end
    
      it "should accept valid email addresses" do
        addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
        addresses.each do |address|
          subject.email = address
          subject.should be_valid
        end
      end
    
      it "should reject invalid email addresses" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
        addresses.each do |address|
          subject.email = address
          subject.should_not be_valid
        end
      end
    
      it "should reject duplicate email addresses" do
        create(:user, email: subject.email)
        subject.should_not be_valid
      end
    
    end
  end
  
  context "methods" do

  end
  
  context "associations" do
    it { should have_many(:ratings) }
    it { should have_many(:beers).through(:ratings) }
  end

end