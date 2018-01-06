require "rails_helper"


feature "User can search for best buy location" do
  scenario "User submits a valid zipcode" do

    visit "/"

  fill_in('search', :with => '80202')
  click_on "Search"

  expect(current_path).to eq(search_path)

  expect(page).to have_content("17 Total Stores")

  within(first(".result")) do
    expect(page).to have_css(".long_name")
    expect(page).to have_css(".city")
    expect(page).to have_css(".distance")
    expect(page).to have_css(".phone_number")
    expect(page).to have_css(".store_type")
  end
end
end
