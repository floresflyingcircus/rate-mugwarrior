module AuthMacros
  def sign_in(attributes = {})
    @_current_user = create(:user, attributes)
    visit about_path
    fill_in "Email", with: "example@example.com"
    click_button "Start Ranking"
  end
end