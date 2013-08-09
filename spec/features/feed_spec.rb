require 'spec_helper'

feature "feed :" do
  context "Given a number of pre-entered beers as a signed-in user" do
    before do
      @beer1 = create(:beer)
      @beer2 = create(:beer)
      sign_in
    end

    scenario "I can see a list of beers" do
      visit beers_path
      expect(page).to have_content @beer1.name
      expect(page).to have_content @beer2.name
    end

    scenario "I can see the brewers of the beers" do
      visit beers_path
      expect(page).to have_content @beer1.brewery_name
      expect(page).to have_content @beer2.brewery_name
    end

    scenario "I can see the date the beers were submitted" do
      visit beers_path
      expect(page).to have_content @beer1.created_at.strftime("%B %d %Y")
      expect(page).to have_content @beer2.created_at.strftime("%B %d %Y")
    end

    scenario "I can see the rating of the beers" do
      rating1 = create(:rating, beer: @beer1, rank: 2)
      rating2 = create(:rating, beer: @beer1, rank: 5)
      visit beers_path
      pending "Spec not implemented yet"
    end

    scenario "I can see a picture of the beers" do
      pending "Has not yet been implemented"
    end
  end

end