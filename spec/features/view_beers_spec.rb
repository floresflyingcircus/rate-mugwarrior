require 'spec_helper'

feature "View Beers Spec :" do 
  context "Given a user who has added beers" do
    before {}
    context "and the user is not logged in " do
      it "Page should forward to homepage" do
        pending "Logging in users not implemented."
      end
      
    end
    context "and the user is logged in " do
      scenario "I should see a list of the beers I have implemented" do
        pending "Logging in users not implemented."
      end
      scenario "I should see ranks I have given beers in the past" do
        pending "Logging in users not implemented."
      end
      scenario "I should be able to give ranks to beers" do
        pending "Logging in users not implemented."
      end
    end


  end
  context "Given a user who has not added beers" do
    before { sign_in }
    context "and there are beers in the system" do
      scenario "I should be able to give ranks to previously entered beers from other users" do
        pending "Not yet implemented"
      end
    end
    context "and there are not beers in the system" do
      scenario "I should see notice explaining" do
        # expect(Brewery.count).to eq 0
        # visit breweries_path
        # expect(page).to have_content "There are no beers yet!"
      end
    end

  end
end