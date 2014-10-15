def login_user
  visit '/'
  click_on 'Login'
  fill_in 'user_username', :with => 'RadicalEdward'
  fill_in 'user_password', :with => 'Ein1234'
  click_on 'LOGIN'
end