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
end