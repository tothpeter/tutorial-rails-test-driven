require "rails_helper"

feature "User creates todo" do
  scenario "successfully" do
    sign_in
    
    create_todo "Frist todo"

    expect(page).to display_todo "Frist todo"
  end
end