def create_user
  User.destroy_all
  User.create!(username: 'RadicalEdward', password: 'Ein1234', first_name: 'Ed', last_name: 'Tivrusky', bio: 'Hacker prodigy from Earth', frequency: 'monthly')
end

def create_other_user
  User.destroy_all(username: 'BlackD0g35')
  User.create!(username: 'BlackD0g35', password: '1arm3d', first_name: 'Jet', last_name: 'Black', bio: 'Former ISSP investigator. Bounty Hunter. Chef.', frequency: 'weekly')
end

def create_rant(id)
  Rant.create!(topic: 'Food', rant: 'It is so annoying that we are always out of food on this spaceship!', user_id: id)
end