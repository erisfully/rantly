require 'spec_helper'

feature "Following" do
  it "User can follow another user" do
    create_user
    other_user = create_other_user
    create_rant(other_user.id)
    login_user

    click_on("Follow", exact: true)
    click_on "Following"

    expect(page).to have_content("Following")
    expect(page).to have_content(other_user.username)
  end
end