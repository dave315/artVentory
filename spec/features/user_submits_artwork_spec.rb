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
  let!(:artwork) { FactoryGirl.create(:artwork, category: category) }

  scenario "user fills out name in series form" do
    visit new_artwork_path

    find_field('Title')
    fill_in('Title', with: artwork.title)

    find_field('Number in series')
    fill_in('Number in series', with: artwork.number_in_series)

    find_field('Category')
    select category.name, from: "Category"

    find_field('Photo')
    fill_in('Photo', with: artwork.photo)

    page.find('#artwork_date').set(artwork.date)

    click_button "Submit"

    expect(page).to have_content("Artwork Save Correctly.")
    expect(page).to have_content(artwork.title)
  end
end
