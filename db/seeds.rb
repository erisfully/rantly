# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(username: 'admin', password: 'admin123', first_name: 'Admin', last_name: 'Adminer', bio: 'Admin', frequency: 'monthly', avatar: File.open(File.join(Rails.root, 'app/assets/images/corgi-sunglasses.jpg')), admin: true, email: 'admin@example.com')
bio