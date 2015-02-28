module Features
  def sign_in
    visit "/"
    fill_in "Email", with: "person@example.com"
    click_on "Sign in"
  end
end