require 'spec_helper'
require 'launchy'

feature 'Search' do
  it 'user can search by first name' do
    create_user
    other_user = create_other_user
    rant = create_rant(other_user.id)
    login_user
    visit '/search'

    fill_in "search", :with => other_user.first_name
    click_on "SEARCH"
    expect(page).to have_content(rant.rant)

    fill_in "search", :with => other_user.last_name
    click_on "SEARCH"
    expect(page).to have_content(rant.rant)

    fill_in "search", :with => other_user.username
    click_on "SEARCH"
    expect(page).to have_content(rant.rant)

    fill_in "search", :with => "Food"
    click_on "SEARCH"
    expect(page).to have_content(rant.rant)

    fill_in "search", :with => "annoying"
    click_on "SEARCH"
    expect(page).to have_content(rant.rant)
  end
end