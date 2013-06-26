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
      expect(page).to have_content @beer1.brewer_name
      expect(page).to have_content @beer2.brewer_name
    end

    scenario "I can see the date the beers were submitted" do
      visit beers_path
      expect(page).to have_content @beer1.created_at.strftime("%B %d %Y")
      expect(page).to have_content @beer2.created_at.strftime("%B %d %Y")
    end

    scenario "I can see the rating of the beers" do
      pending "Has not yet been implemented"
    end

  end

end