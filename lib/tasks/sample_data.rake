require 'faker'

namespace :db do
  desc "Fill db with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    admin = User.create(:first_name => "john", :last_name => "malkovich", :email => "john@malkovich.com", 
                        :password => "password")
    
    99.times do |n|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = "example-#{n+1}@example.com"
      password = "password"
      User.create(:first_name => first_name, :last_name => last_name, :email => email, :password => password)
    end
    
    User.all(:limit => 6).each do |user|
      4.times do |n|
        user.identities.create!(:identity_name => "My Identity #{n+1}", 
                                :first_name => user.first_name,
                                :last_name => user.last_name,
                                :company_name => Faker::Company.name,
                                :title => Faker::Company.suffix,
                                :country => "USA",
                                :state => Faker::Address.us_state_abbr,
                                :city => Faker::Address.city,
                                :address => Faker::Address.street_address,
                                :email => "example-#{n+1}@example.com",
                                :cell => Faker::PhoneNumber.phone_number,
                                :phone => Faker::PhoneNumber.phone_number,
                                :skype => user.first_name,
                                :messenger => user.last_name,
                                :gtalk => user.first_name,                               
                                :facebook => user.first_name,
                                :twitter => user.last_name,
                                :linkedin => user.first_name,
                                :flickr => user.last_name,
                                :blog => Faker::Internet.domain_name,
                                :youtube => user.first_name,
                                :birthday => "05/04/1979",
                                :photo_url => "me.jpg",
                                :description => Faker::Lorem.sentence,
                                :qr_url => "http://chart.apis.google.com/chart?chs=200x200&cht=qr&chl=http://code.google.com/apis/chart/image_charts.html")
      end
      
      user.update_attributes(:default_identity_id => user.identities.first.id, :lat => "37.7" + rand().to_s.delete("."), :lng => "-122.3" + rand().to_s.delete("."))
    end
  end
end