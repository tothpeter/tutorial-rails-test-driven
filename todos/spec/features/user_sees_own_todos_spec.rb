require "rails_helper"

feature "User sees own todos" do
  scenario "doesn't see others' todos" do
    Todo.create!(title: "Buy milk", email: "someone_else@example.com")

    sign_in_as "someone_else@example"

    expect(page).not_to have_css ".todos li", text: "Buy milk"

    click_on "Add a new todo"
    fill_in "Title", with: "Frist todo"
    click_on "Submit"

    expect(page).to have_css ".todos li", text: "Frist todo"
    expect(page).not_to have_css ".todos li", text: "Buy milk"
  end
end