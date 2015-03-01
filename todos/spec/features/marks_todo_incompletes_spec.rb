require "rails_helper"

feature "User marks todo incompletes" do
  scenario "successfully" do
    sign_in_as "someone@example.com"

    create_todo "Buy milk"

    expect(page).to display_todo "Buy milk"

    click_on "Mark complete"
    click_on "Mark incomplete"

    expect(page).not_to display_compeleted_todo "Buy milk"
    expect(page).to display_todo "Buy milk"
  end
end