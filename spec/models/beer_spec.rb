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

    describe "state" do
      it { should allow_mass_assignment_of(:brewery_id)}
      it { should allow_value(@brewery.id).for(:brewery_id) }
      it { should validate_presence_of(:brewery_id) }
    end
  end

  describe "associations" do
    it { should belong_to(:brewery) }
  end

  describe "methods" do

  end
end