require 'spec_helper'

feature "Following" do
  it "User can follow another user" do
    create_user
    other_user = create_other_user
    rant = create_rant(other_user.id)
    login_user

    click_on("Follow", exact: true)
    expect(page).to have_content "Unfollow"
    click_on "Following"

    expect(page).to have_content("Following")
    expect(page).to have_content(other_user.first_name)
    expect(page).to_not have_content(rant.rant)

    click_on("Unfollow")
    expect(page).to_not have_content(other_user.first_name)
  end
end