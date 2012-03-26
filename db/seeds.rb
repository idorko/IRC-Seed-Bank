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
seed = Seed.create! :variety => 'Bud', :family => 'Rose', :spacing => 5, :maturity => 3, :common_names => "none"
puts 'Seed created: ' << seed.humanize

puts 'SETTING UP DEFAULT DONOR'
donor = Donor.create! :name => 'Joes Seeds', :contact_name => "Joe", :contact_phone => "555-555-5555", :email => 'joe@donor.com'
puts 'Donor Created:' << donor.name

puts 'SETTING UP DEFAULT FARMER'
farmer = Farmer.create! :name => 'Joe Farmer', :country => "Uganda", :language => "Ugandan", :farm_site => "SLC"
puts 'Farmer Created:' << farmer.name

puts 'SETTING UP DEFAULT DONATION'
donation = Donation.create! :quantity => 100, :value => 10.5
donation.donor = donor
donation.seed = seed
donation.save
seed.update_quantity
puts 'Default donation created:' << donation.seed.humanize << seed.pounds

puts 'SETTING UP DEFAULT DISPENSAL'
dispensal = Dispensal.create! :quantity => 10
dispensal.farmer = farmer
dispensal.seed = seed
dispensal.save
seed.dispensals << dispensal
seed.update_quantity
puts 'Default dispensal created:' << dispensal.seed.humanize << seed.pounds


