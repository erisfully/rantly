require 'spec_helper'
require 'launchy'

feature 'Admin' do
  scenario 'Admin can log in and see a list of all rants ordered by date' do
    user = create_admin_user
    rant1 = create_rant(user.id)
    rant2 = create_rant(user.id)
    login_user

    expect(page).to have_content(rant1.rant + rant2.rant)
  end

end