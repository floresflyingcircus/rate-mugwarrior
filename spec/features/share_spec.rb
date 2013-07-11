require 'spec_helper'

feature "feed :" do
  context "Given valid entry" do
    before do
      sign_in
    end

    scenario "I can share a new beer" do
      expect(Beer.all.size).to eq 0
      visit new_beer_path
      fill_in "Beer Name", with: "Example Beer"
      fill_in "Brewery", with: "Example Brewery"
      click_button "Save"
      expect(Beer.all.size).to eq 1
    end

    scenario "I can share a new beer from an existing brewery" do
      expect(Brewer.all.size).to eq 0
      visit new_beer_path
      fill_in "Beer Name", with: "Example Beer"
      fill_in "Brewery", with: "Example Brewery"
      click_button "Save"
      expect(Beer.all.size).to eq 1
      expect(Brewer.all.size).to eq 1
    end

    scenario "I can share a new beer from an existing brewery" do
      brewer = create(:brewer)
      expect(Brewer.all.size).to eq 1
      visit new_beer_path
      fill_in "Beer Name", with: "Example Beer"
      fill_in "Brewery", with: brewer.name
      click_button "Save"
      expect(Beer.all.size).to eq 1
      expect(Brewer.all.size).to eq 1
    end

    scenario "I can share a new beer from an existing brewery" do
      pending "Implemented but not tested"
      # brewer1 = create(:brewer, name: "exbmple")
      # brewer2 = create(:brewer, name: "example")
      # brewer3 = create(:brewer, name: "excmple")
      # visit new_beer_path
      # fill_in "Beer Name", with: "Example Beer"
      # fill_in "Brewery", with: "ex"
      # expect(page).to have_content brewer1.name
      # expect(page).to have_content brewer2.name
      # expect(page).to have_content brewer3.name
    end

    
  end
end