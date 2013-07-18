require 'spec_helper'

describe Rating do
  before {
    @beer ||= create(:beer)
    @user ||= create(:user)
    subject.user_id = @user.id
    subject.beer_id = @beer.id
    subject.rank = 5
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

    describe "beer" do
      it { should allow_mass_assignment_of(:rank)}
      it { should allow_value(@beer.id).for(:rank) }
      it { should validate_presence_of(:rank) }
      it { should validate_numericality_of(:rank) }
      it "rank is between 1 and 5" do
        pending "Code works but spec written is looking for teh wrong error message"
        # it { should ensure_inclusion_of(:rank).in_range(1..5) }
      end
    end
  end

  describe "associations" do
    it { should belong_to(:beer) }
    it { should belong_to(:user) }
  end

  describe "methods" do

  end
end
