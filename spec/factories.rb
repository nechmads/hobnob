Factory.sequence :email do |n|
  "person#{n}@example.com"
end

Factory.sequence :lat do |n|
  "37.7#{n}417"
end

Factory.sequence :lng do |n|
  "-122.3#{n}568"
end

Factory.define :user do |user|
  user.first_name "john"
  user.last_name "malkovich"
  user.email { Factory.next(:email) }
  user.password "password"
  user.lat { Factory.next(:lat) }
  user.lng { Factory.next(:lng) }
  user.linkedin_id "nechmads"
end

Factory.define :identity do |identity|
  identity.identity_name "Main Identity"
  identity.first_name "Shahar"
  identity.last_name "Nechmad"
  identity.company_name "Death Star Labs"
  identity.title "CEO"
  identity.country "USA"
  identity.state "CA"
  identity.city "San Francisco"
  identity.address "2000 broadway, apt 432"
  identity.email "shahar@nechmad.com"
  identity.cell "4153075345"
  identity.phone "432576847"
  identity.skype "nechmads"
  identity.messenger "nechmad"
  identity.gtalk "me@shaharnechmad.com"
  identity.facebook "nechmads"
  identity.twitter "nechmads"
  identity.linkedin "nechmad"
  identity.flickr "nechmads"
  identity.blog "http://www.shaharnechmad.com"
  identity.youtube "nechmads"
  identity.birthday "03/05/1979"
  identity.photo_url "me.jpg"
  identity.description "this is a short description of me"
  identity.qr_url "http://chart.apis.google.com/chart?chs=200x200&cht=qr&chl=http://code.google.com/apis/chart/image_charts.html"
  identity.association :user
end