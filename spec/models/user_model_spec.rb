require 'spec_helper'

describe User do

  it 'User can be created' do
  username = 'b0untyhunt3r'
  first_name ='Spike'
  last_name = 'Speigel'
  password = 'ILoveJulia'
  bio = 'Former crime syndicate member turned bounty hunter. Hates children, pets, and women with attitude.'
  frequency = 'weekly'
  avatar = File.open(File.join(Rails.root, 'app/assets/images/corgi-sunglasses.jpg'))

                                        User.create(:username => username, :first_name => first_name, :last_name => last_name, :password => password, :bio => bio, :frequency => frequency, :avatar => avatar)
  success = User.find_by_username(username) != nil
  expect(success).to eq(true)
  end
end

