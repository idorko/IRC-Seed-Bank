# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :email => 'user@example.com', :password => 'please', :password_confirmation	=> 'please'
puts 'New user created: ' << user.email
puts 'SETTING UP DEFAULT SEED'
seed = Seed.create! :variety => 'Bud', :family => 'Rose'
puts 'Seed created: ' << seed.humanize
puts 'SETTING UP DEFAULT DONOR'
donor = Donor.create! :name => 'Joe Donor', :email => 'joe@donor.com'
puts 'Donor Created:' << donor.name
puts 'SETTING UP DEFAULT FARMER'
farmer = Farmer.create! :name => 'Joe Farmer'
puts 'Farmer Created:' << farmer.name
puts 'SETTING UP DEFAULT DONATION'
donation = Donation.create! :quantity => 100
donation.donor = donor
donation.seed = seed
donation.save
seed.update_quantity
puts 'Default donation craeted:' << donation.seed.humanize << seed.pounds
