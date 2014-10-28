require 'spec_helper'

feature "Rants" do
  scenario "user clicks on body of rant and sees rant page" do
    create_user
    other_user = create_other_user
    rant = create_rant(other_user.id)
    login_user

    click_on(rant.rant)
    expect(page).to have_content(rant.topic)
    expect(page).to have_content(rant.rant)
    expect(page).to_not have_content("My Rants")

    click_on(other_user.first_name)
    expect(page).to have_content(other_user.frequency.capitalize)
  end

  scenario "rant form is filled out incorrectly" do
    create_user
    login_user

    click_on "RANT"
    expect(page).to have_content "Topic can't be blank"
    expect(page).to have_content "Rant can't be blank"

    fill_in 'rant_topic', :with => "!" * 51
    fill_in 'rant_rant', :with => "A"
    click_on "RANT"

    expect(page).to have_content "Topic is too long (maximum is 50 characters)"
    expect(page).to have_content "Rant is too short (minimum is 140 characters)"
  end
end