require 'rails_helper'

feature "User fills out series form", %(
  as a user
  i want to fill out the series form
  So that i can submit a new art series

  Acceptance Criteria:
  [ ] I can fill out the series form with a name (required);
  [ ] total number of art in the series (required)
  [ ] date of series (optional)
  [ ] description (optional)

) do

  scenario "user fills out name in series form" do
    visit new_category_path

    find_field('Name')
    fill_in('Name', with: 'Chinese Vases')

    find_field('Total printed')
    fill_in('Total printed', with: 50)

    find_field('Description')
    fill_in('Description', with: "Chinese artwork on vases by Elaine Simel")

    click_button("Create Category")

    expect(page).to have_content("Category Created Successfully.")
  end
end
