require 'faker'

namespace :db do
  desc "Fill db with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    # Create one known user
    #admin = User.create(:first_name => "john", :last_name => "malkovich", :email => "john@malkovich.com", 
    #                    :password => "password")
    
    # Create additional users
    20.times do |n|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = "example-#{n+1}@example.com"
      password = "password"
      User.create(:first_name => first_name, :last_name => last_name, :email => email, :password => password)
    end
    
    # Create identities for some of the users
    User.all(:limit => 20).each do |user|
      4.times do |n|
        user.identities.create!(:identity_name => "My Identity #{n+1}", 
                                :first_name => user.first_name,
                                :last_name => user.last_name,
                                :company_name => Faker::Company.name,
                                :title => Faker::Company.suffix,
                                :industry => "Internet",
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
                                :photo_url => "http://media02.linkedin.com/mpr/mpr/shrink_80_80/p/3/000/004/2c0/2268811.jpg",
                                :description => Faker::Lorem.sentence,
                                :qr_url => "http://chart.apis.google.com/chart?chs=200x200&cht=qr&chl=http://code.google.com/apis/chart/image_charts.html")
                                
      end
      
      user.update_attributes(:default_identity_id => user.identities.first.id, :lat => "37.79" + rand().to_s.delete("."), :lng => "-122.40" + rand().to_s.delete("."), :last_location_update_time => Time.now)
    end
    
    # Create places
    20.times do |n|
      name = Faker::Company.name
      Place.create(:name => name, :lat => "37.7#{n}417", :lng => "-122.3#{n}568", :isTimeBase => true, :start => Time.now - 10.days, :end => Time.now + 200.days, :foursquare_id => "468aa2b5f964a52060481fe3")
    end
    
    # Create events
    placeId = Place.first().id;
    
    2.times do |c|
      3.times do |t|
        name = Faker::Company.name
        Event.create(:name => name, :track => t, :collection => c, :description => Faker::Lorem.sentence, :event_type => 1, :time => Time.now, :place_id => placeId)
      end
      3.times do |t|
        name = Faker::Company.name
        Event.create(:name => name, :track => t, :collection => c, :description => Faker::Lorem.sentence, :event_type => 1, :time => Time.now + 1.hour, :place_id => placeId)
      end
      3.times do |t|
        name = Faker::Company.name
        Event.create(:name => name, :track => t, :collection => c, :description => Faker::Lorem.sentence, :event_type => 1, :time => Time.now + 1.day, :place_id => placeId)
      end
       3.times do |t|
          name = Faker::Company.name
          Event.create(:name => name, :track => t, :collection => c, :description => Faker::Lorem.sentence, :event_type => 1, :time => Time.now + 2.day, :place_id => placeId)
      end
    end
    
    # Create checkins
    User.all(:limit => 20).each do |user|
      user.checkins.create!(:place_id => placeId, :time => Time.now + 1.hour)
    end
    
    # Create messages
    users = User.all(:limit => 2)
    10.times do 
      Message.create(:sender_id => users[0].id, :recipient_id => users[1].id, :title => "", :body => Faker::Lorem.sentence, :is_read => false, :sent_time => Time.now)
    end
    10.times do 
      Message.create(:sender_id => users[1].id, :recipient_id => users[0].id, :title => "", :body => Faker::Lorem.sentence, :is_read => false, :sent_time => Time.now)
    end
  end
end