require 'spec_helper'

feature 'Profile' do
  it "shows all the user's rants" do
    create_user
    other_user = create_other_user
    rant = create_rant(other_user.id)
    login_user

    click_on(other_user.first_name)
    expect(page).to have_content(rant.rant)
    expect(page).to_not have_content("My Rants")
  end

  it "user can follow from profile page" do
    create_user
    other_user = create_other_user
    create_rant(other_user.id)
    login_user

    click_on(other_user.first_name)
    click_on("Follow", exact: true)
    expect(page).to have_content "Unfollow"

    click_on("Following")
    expect(page).to have_content(other_user.first_name)
  end

  it "user's rants are ordered by most favorites" do
    user = create_user
    other_user = create_other_user
    rant_1 = create_rant(other_user.id)
    create_favorite(user.id, rant_1.id)
    rant_2 = create_rant(other_user.id)
    login_user

    #finish this later
  end
end