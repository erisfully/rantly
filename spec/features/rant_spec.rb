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

  scenario "User favorites a rant" do
    create_user
    other_user = create_other_user
    rant = create_rant(other_user.id)
    login_user

    click_on "Favorite"

    expect(page).to have_content "1 - Unfavorite"

    click_on "Favorites"

    expect(page).to have_content("Favorites")
    expect(page).to have_content(other_user.first_name)
    expect(page).to have_content(rant.rant)

    click_on "Unfavorite"

    expect(page).to_not have_content(rant.rant)

    click_on "Dashboard"
    click_on rant.rant
    click_on "Favorite"

    expect(page).to have_content "Unfavorite"
  end

  scenario "User sees when they are mentioned" do
    user = create_user
    other_user = create_other_user
    rant = create_mention_rant(user, other_user.id)
    login_user

    expect(page).to have_content ("Mentions #{other_user.first_name}" + " " + "#{rant.rant}")
  end

  scenario "User can comment on rant" do
    create_user
    other_user = create_other_user
    rant = create_rant(other_user.id)
    login_user

    click_on rant.rant

    fill_in "comment_comment", :with => "Here's my comment"
    click_on "RANT BACK"

    expect(page).to have_content "Here's my comment"
  end

  scenario "User can mark rant as spam" do
    create_user
    other_user = create_other_user
    rant = create_rant(other_user.id)
    login_user

    click_on rant.rant
    click_on "Spam"
    expect(page).to have_content "Unspam"
    expect(page).to_not have_content "Spam"

    click_on "Unspam"
    expect(page).to have_content "Spam"
    expect(page).to_not have_content "Unspam"
  end
end