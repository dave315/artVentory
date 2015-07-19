require 'spec_helper'

feature "User fills out artwork form", %(
  as a user
  i want to fill out the artwork form
  So that i can submit a new piece of artwork

  Acceptance Criteria:
  [ ] I can fill out the series artwork form and includes;
  [ ] Series Number
  [ ] Art Series
  [ ] Title
  [ ] Photo_URL
  [ ] Date

) do

  let!(:category) { FactoryGirl.create(:category) }
  scenario "user fills out name in series form" do
    visit new_artwork_path

    find_field('Title')
    fill_in('Title', with: "Test Title")

    find_field('Number in series')
    fill_in('Number in series', with: 1)

    find_field('Category')
    select category.name, from: "Category"

    find_field('Photo')
    attach_file('artwork[photo]',
      File.absolute_path('./spec/support/upload/test_pic.jpg'))

    click_button "Submit"
    page.find('.artwork-photo')['src'].should have_content 'test_pic.jpg'
    expect(page).to have_content("Artwork Save Correctly.")
    expect(page).to have_content("Test Title")
  end
end
