require "rails_helper"


feature "User can search for best buy location" do
  scenario "User submits a valid zipcode" do

    visit "/"

# When I visit "/"
  fill_in('search', :with => '80202')
  click_on "Search"
# And I fill in a search box with "80202" and click "search"
  expect(current_path).to eq(search_path)
  save_and_open_page
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
  expect(page).to have_content("17 Total Stores")
  expect(page).to have_css(".results", count: 10)

  within(first(".result")) do
    expect(page).to have_css(".long_name")
    expect(page).to have_css(".city")
    expect(page).to have_css(".distance")
    expect(page).to have_css(".phone_number")
    expect(page).to have_css(".store_type")
  end
end
end


# And I should see a message that says "17 Total Stores"
# And I should see exactly 10 results (There are 17 stores within 25 miles. We want to display 10 on this page and 7 on the next. Get the first page to work first from start to finish and worry about pagination later.)
# And I should see the long name, city, distance, phone number and store type for each of the 10 results
