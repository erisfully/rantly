require 'spec_helper'

feature 'user login' do

  scenario 'user can visit the homepage' do
    visit '/'
    expect(page).to have_content 'Rantly Let it all out'
    expect(page).to have_content 'Ranty rant rant'
    expect(page).to have_content 'Rantimus, king of Ranter'
    expect(page).to have_selector('img[alt="Corgi sunglasses"]')
  end


end