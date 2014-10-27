def login_user
  visit root_path
  click_on 'Login'
  fill_in 'user_username', :with => 'RadicalEdward'
  fill_in 'user_password', :with => 'Ein12345'
  click_on 'LOGIN'
end

