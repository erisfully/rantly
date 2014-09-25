require 'spec_helper'

feature 'User login' do
  scenario 'User can register' do
    visit '/'
    click_on 'JOIN'
    expect(page).to have_content('Register')


  end
end