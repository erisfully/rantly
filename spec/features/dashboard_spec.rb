require 'spec_helper'
require 'launchy'

feature 'Dashboard' do
  before do
    create_user
    login_user
  end
  it 'User can post and delete a rant' do
    fill_in 'rant_topic', :with => 'Stuff'
    fill_in 'rant_rant', :with => 'Oh man, stuff, it\'s just awful!'

    click_on 'RANT'
    expect(page).to have_content("Oh man, stuff, it's just awful!")

    click_on 'Delete'
    expect(page).to_not have_content ("Oh man, stuff, it's just awful!")
  end
end