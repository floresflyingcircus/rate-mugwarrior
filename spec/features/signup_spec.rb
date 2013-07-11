require 'spec_helper'

feature "signup :" do
  context "As a new user" do
    scenario "I can enter my email to create an account" do
      expect(User.all.count).to eq 0
      visit root_url
      click_link "Lets Get Started"
      fill_in "Email", with: "example@example.com"
      click_button "Start Ranking"
      expect(User.all.count).to eq 1
      expect(page).to have_content "Ready"
    end
  end
  context "As an existing user" do
    before { User.create(email: "example@example.com") }
    scenario "Entering my email does not create a new account" do
      expect(User.all.count).to eq 1
      visit root_url
      click_link "Lets Get Started"
      fill_in "Email", with: "example@example.com"
      click_button "Start Ranking"
      expect(User.all.count).to eq 1
      expect(page).to have_content "Ready"
    end
  end
  context "With a bad email" do
    scenario "Entering it throws an error" do
      expect(User.all.count).to eq 0
      visit about_path
      fill_in "Email", with: "example@example"
      click_button "Start Ranking"
      expect(User.all.count).to eq 0
      expect(page).to have_content "problem"
    end
  end
end
