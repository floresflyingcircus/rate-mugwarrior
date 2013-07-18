require 'spec_helper'

feature "static pages :" do
  context "On the homepage" do
    before do

    end

    scenario "I can not see navigation" do
      visit root_url
      expect(page).to_not have_link "Feed"
      expect(page).to_not have_link "Share"
      expect(page).to_not have_link "Rank"
    end

    scenario "I can not see navigation" do
      visit about_path()
      expect(page).to_not have_link "Feed"
      expect(page).to_not have_link "Share"
      expect(page).to_not have_link "Rank"
    end
  end
end