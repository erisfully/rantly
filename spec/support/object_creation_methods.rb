def create_user
  User.destroy_all
  User.create!(username: 'RadicalEdward', password: 'Ein12345', first_name: 'Ed', last_name: 'Tivrusky', bio: 'Hacker prodigy from Earth', frequency: 'monthly')
end

def create_other_user
  User.destroy_all(username: 'BlackD0g35')
  User.create!(username: 'BlackD0g35', password: '1arm3d123', first_name: 'Jet', last_name: 'Black', bio: 'Former ISSP investigator. Bounty Hunter. Chef.', frequency: 'weekly')
end

def create_rant(id)
  Rant.create!(topic: 'Food', rant: "@RadicalEdward It is so annoying that we are always out of food on this spaceship! #{"!" * 140}", user_id: id)
end

def create_favorite(user_id, rant_id)
  Favorite.create!(user_id: user_id, rant_id: rant_id)
end