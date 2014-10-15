require 'spec_helper'
require 'launchy'

feature 'Dashboard' do
  it 'User can post and delete a rant' do
    create_user
    login_user

    fill_in 'rant_topic', :with => 'Stuff'
    fill_in 'rant_rant', :with => 'Oh man, stuff, it\'s just awful!'

    click_on 'RANT'
    expect(page).to have_content("Oh man, stuff, it's just awful!")
    click_on 'Delete'
    expect(page).to_not have_content ("Oh man, stuff, it's just awful!")
  end

  it "User can see other users' rants" do
    create_user

    other_user = create_other_user
    rant = create_rant(other_user.id)

    login_user
    save_and_open_page
    expect(page).to have_content "Latest Rants #{other_user.first_name} #{rant.rant}"
  end
end