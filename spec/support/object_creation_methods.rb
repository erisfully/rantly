def create_user
  User.destroy_all
  User.create!(username: 'RadicalEdward', password: 'Ein12345', first_name: 'Ed', last_name: 'Tivrusky', bio: 'Hacker prodigy from Earth', frequency: 'monthly', avatar: File.open(File.join(Rails.root, 'app/assets/images/corgi-sunglasses.jpg')), admin: false)
end

def create_other_user
  User.destroy_all(username: 'BlackD0g35')
  User.create!(username: 'BlackD0g35', password: '1arm3d123', first_name: 'Jet', last_name: 'Black', bio: 'Former ISSP investigator. Bounty Hunter. Chef.', frequency: 'weekly', avatar: File.open(File.join(Rails.root, 'app/assets/images/corgi-sunglasses.jpg')), admin: false)
end

def create_rant(id)
  Rant.create!(topic: 'Food', rant: "It is so annoying that we are always out of food on this spaceship! #{"!" * 140}", user_id: id)
end

def create_favorite(user_id, rant_id)
  Favorite.create!(user_id: user_id, rant_id: rant_id)
end

def create_mention_rant(user, id)
  Rant.create!(topic: 'Rant', rant: "@#{user.username + "!" * 140}", user_id: id)
end


def create_admin_user
  User.destroy_all(username: 'SwimmingBird')
  User.create!(username: 'SwimmingBird', password: 'Il0veJulia', first_name: 'Spike', last_name: 'Spiegel', bio: 'Dislikes children, pets and women with attitude', frequency: 'monthly', avatar: File.open(File.join(Rails.root, 'app/assets/images/corgi-sunglasses.jpg')), admin: true)
end



