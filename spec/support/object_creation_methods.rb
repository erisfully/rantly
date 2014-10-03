def create_user
  User.destroy_all

  User.create!(username: 'RadicalEdward', password: 'Ein1234', first_name: 'Ed', last_name: 'Tivrusky', bio: 'Hacker prodigy from Earth', frequency: 'monthly')
end


