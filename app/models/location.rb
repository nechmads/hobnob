class Location < ActiveRecord::Base
  belongs_to :user, :polymorphic => true
  acts_as_mappable  :default_units => :miles, 
  #                  :default_formula => :sphere, 
  #                  :distance_field_name => :distance,
  #                  :lat_column_name => :lat,
  #                  :lng_column_name => :lng
end
