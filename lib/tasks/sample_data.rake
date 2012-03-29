namespace :db do
	desc "Fill databsae with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		99.times do |n|
			#create test donors
			name = Faker::Company.name
			contact_name = Faker::Name.name
			email = "example-#{n+1}@example.com"
			phone = Faker::PhoneNumber.phone_number
			donor = Donor.create!(:name => name,
										:contact_name => contact_name,
										:email => email,
										:contact_phone => phone )

			#create test farmers
			name = Faker::Name.name
			language = Faker::Lorem.words(1)[0].to_s
			country = Faker::Address.country
			farm_site = Faker::Lorem.words(1)[0].to_s
			farmer = Farmer.create!(:name => name,
										 :language => language,
										 :country => country,
									   :farm_site => farm_site)

			#create test seeds
			family = Faker::Lorem.words(1)[0].to_s
			variety = Faker::Lorem.words(1)[0].to_s
			spacing = "#{rand(1..5)}-#{rand(6..10)}"
			maturity = rand(1..10)
			common_names = Faker::Name.first_name + ", " + Faker::Name.first_name + ", " + Faker::Name.first_name + ", " + Faker::Name.first_name
			description = Faker::Lorem.paragraph

			seed = Seed.create!(:family => family,
													:variety => variety,
													:spacing => spacing,
													:maturity => maturity,
													:common_names => common_names,
													:description => description)
			
			10.times do |m|
				#create test donation
				donation = Donation.create!(:quantity => rand(100..300), :value => rand(1..100))
				donation.donor = donor
				donation.seed = seed
				donation.save
				seed.donations << donation
				seed.update_quantity

				#create test donation for farmer
				donation = Donation.create!(:quantity => rand(100..300), :value => rand(1..100))
				donation.farmer = farmer
				donation.seed = seed
				donation.save
				seed.donations << donation
				seed.update_quantity

				#create test dispensal
				dispensal = Dispensal.create!(:quantity => rand(1..99))
				dispensal.farmer = farmer
				dispensal.seed = seed
				dispensal.save
				seed.dispensals << dispensal
				seed.update_quantity
			end
		end
	end
end
			
