require 'spec_helper'

describe Beer do
  before {
    @brewery ||= create(:brewery)
    subject.name = "Aprihop"
    subject.brewery_id = @brewery.id
  }

  describe "factory" do
    it "is valid" do
      create(:beer)
    end
    it "is able to generate multiple items" do
      2.times do
        create(:beer)  
      end
    end
  end

  describe "scopes" do

  end

  describe "validation" do
    describe "the subject" do
      it { should be_valid }  
    end
    describe "name" do
      it { should allow_mass_assignment_of(:name)}
      it { should allow_value("United States").for(:name) }
      it { should validate_presence_of(:name) }
      describe "if missing" do
        before {subject.name = nil}
        it "raises an error" do
          expect(subject).to have(1).errors_on(:name)  
        end
      end
    end

    describe "brewery" do
      it { should allow_mass_assignment_of(:brewery_id)}
      it { should allow_value(@brewery.id).for(:brewery_id) }
      it { should validate_presence_of(:brewery_id) }
    end
  end

  describe "associations" do
    it { should belong_to(:brewery) }
    it { should have_many(:ratings) }
    it { should have_many(:users).through(:ratings) }
  end

  describe "methods" do
    describe "self.not_rated_yet_by(user)" do
      it "should return Beers which have not yet been rated" do
        user = create(:user)
        beer1 = create(:beer)
        beer2 = create(:beer)
        beers = Beer.not_rated_yet_by(user)
        beers.should =~ [beer1, beer2]
      end
      it "should not return Beers which have been rated" do
        user = create(:user)
        beer1 = create(:beer)
        beer2 = create(:beer)
        rating = create(:rating, user: user, beer: beer1)
        beers = Beer.not_rated_yet_by(user)
        beers.should =~ [beer2]
      end
    end
    describe "self.find_random_unranked_beer_for(user)" do
      it "should return an unranked beer" do
        pending "Need to figure out how to mock Kernel.rand in a model"
        user = create(:user)
        beer1 = create(:beer)
        beer2 = create(:beer)
        beers = Beer.find_random_unranked_beer_for(user)
        beers.should == [beer1] || [beer2]
      end
      it "should return an unranked beer" do
        pending "Need to figure out how to mock Kernel.rand in a model"
        user = create(:user)
        beer1 = create(:beer)
        beer2 = create(:beer)
        rating = create(:rating, user: user, beer: beer1)
        beers = Beer.find_random_unranked_beer_for(user)
        beers.should =~ [beer2]
      end
    end
    describe "brewery_name" do
      it "should return the brewery name" do
        expect(subject.brewery_name).to eq @brewery.name
      end
    end

    describe "brewery_name=(name)" do
      it "should set brewery to the  brewery with that name if it exists" do
        brewery2 = create(:brewery)
        subject.brewery_name = brewery2.name
        expect(subject.brewery).to eq brewery2
      end
      it "should create a new brewery if no brewery with the name exists" do
        old_count = Brewery.count
        subject.brewery_name=("New Brewery Name")
        expect(Brewery.count).to eq old_count + 1
        
        expect(subject.brewery).to eq Brewery.last
      end
      it "should not change the brewery if no name given" do
        subject.brewery_name=("")
        expect(subject.brewery).to eq @brewery
      end
    end
    describe "average rating" do
      it "should return the average of the ratings for a beer" do
        beer = create(:beer)
        create(:rating, beer: beer, rank: 2)
        create(:rating, beer: beer, rank: 4)
        expect(beer.average_rating).to eq 3
      end
      it "should safely return 0 if there are no ratings" do
        beer = create(:beer)
        expect(beer.average_rating).to eq 0
      end
    end
  end
end























