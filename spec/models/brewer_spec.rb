require 'spec_helper'

describe Brewer do
  before {
    subject.name = "Yards Brewing"
  }

  describe "factory" do
    it "is valid" do
      create(:brewer)
    end
    it "is able to generate multiple items" do
      2.times do
        create(:brewer)  
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
    
  end

  describe "associations" do
    it { should have_many(:beers) }
  end

  describe "methods" do
  end

end
