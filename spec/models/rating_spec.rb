require 'spec_helper'

describe Rating do
  before {
    @beer ||= create(:beer)
    @user ||= create(:user)
    subject.user_id = @user.id
    subject.beer_id = @beer.id
  }

  describe "factory" do
    it "is valid" do
      create(:rating)
    end
    it "is able to generate multiple items" do
      2.times do
        create(:rating)  
      end
    end
  end

  describe "scopes" do

  end

  describe "validation" do
    describe "the subject" do
      it { should be_valid }  
    end

    describe "user" do
      it { should allow_mass_assignment_of(:user_id)}
      it { should allow_value(@beer.id).for(:user_id) }
      it { should validate_presence_of(:user_id) }
    end
    
    describe "beer" do
      it { should allow_mass_assignment_of(:beer_id)}
      it { should allow_value(@beer.id).for(:beer_id) }
      it { should validate_presence_of(:beer_id) }
    end
  end

  describe "associations" do
    it { should belong_to(:beer) }
    it { should belong_to(:user) }
  end

  describe "methods" do

  end
end
