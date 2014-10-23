require 'spec_helper'
require 'launchy'

feature 'User login' do
  scenario 'User can register' do
    visit '/'
    click_on 'JOIN'
    expect(page).to have_content('Register')

    fill_in 'user_username', :with => 'b0untyhunt3r'
    fill_in 'user_first_name', :with => 'Spike'
    fill_in 'user_last_name', :with => 'Speigel'
    fill_in 'user_password', :with => 'ILoveJulia'
    fill_in 'user_bio', :with => 'Former crime syndicate member turned bounty hunter. Hates children, pets, and women with attitude.'
    choose 'user_frequency_weekly'

    click_on 'REGISTER'

    expect(page).to have_content 'Spike Speigel'
    expect(page).to have_content 'Thank you for registering'
  end

  scenario 'User can log in' do
    user = create_user
    visit '/'
    click_on 'Login'

    fill_in 'user_username', :with => user.username
    fill_in 'user_password', :with => user.password
    click_on 'LOGIN'

    expect(page).to have_content 'Ed Tivrusky'
  end
end