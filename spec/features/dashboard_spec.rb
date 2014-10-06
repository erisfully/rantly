require 'spec_helper'
require 'launchy'

feature 'Dashboard' do
  it 'User can post a rant' do
    fill_in 'rant-title', :with => 'Rant'
    fill_in 'rant', :with => ''
    click_on 'RANT'

    expect(page).to have_content('Rant ....')
  end
end