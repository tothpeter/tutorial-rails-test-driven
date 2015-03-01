require "rails_helper"

feature "User completes todo" do
  scenario "successfully" do
    sign_in_as "someone@example.com"

    create_todo "Buy milk"

    expect(page).to display_todo "Buy milk"

    create_todo "Buy milk2"
    
    expect(page).to display_todo "Buy milk2"

    first("li").click_link "Mark complete"

    expect(page).to display_compeleted_todo "Buy milk"
  end
end