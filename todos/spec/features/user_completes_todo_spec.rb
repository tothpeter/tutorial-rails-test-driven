require "rails_helper"

feature "User completes todo" do
  scenario "successfully" do
    sign_in_as "someone@example.com"

    click_on "Add a new todo"
    fill_in "Title", with: "Buy milk"
    click_on "Submit"

    expect(page).to have_css ".todos li", text: "Buy milk"

    click_on "Add a new todo"
    fill_in "Title", with: "Buy milk2"
    click_on "Submit"
    
    expect(page).to have_css ".todos li", text: "Buy milk2"

    first("li").click_link "Mark complete"

    expect(page).to have_css ".todos li.completed", text: "Buy milk"
  end
end