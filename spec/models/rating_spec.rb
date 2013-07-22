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

    describe "rank" do
      it { should allow_mass_assignment_of(:rank)}
      it { should validate_presence_of(:rank) }
      it { should validate_numericality_of(:rank).only_integer }

      #Replace these with the ones commented below when shoulda-matchers catches up
      it { should_not allow_value(0).for(:rank) }
      it { should allow_value(1).for(:rank) }
      it { should allow_value(5).for(:rank) }
      it { should_not allow_value(6).for(:rank) }
      # Shoulda matchers does not include these yet - but it should...
      # it { should validate_numericality_of(:rank).greater_than_or_equal_to(1) }
      # it { should validate_numericality_of(:rank).less_than_or_equal_to(5) }
    end
  end

  describe "associations" do
    it { should belong_to(:beer) }
    it { should belong_to(:user) }
  end

  describe "methods" do

  end
end
