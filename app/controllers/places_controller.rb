class PlacesController < ApplicationController
  #before_filter :protect_resource
  
  def index
     respond_to do |format|
       format.json {
         places = Place.where("isTimeBase = false OR (isTimeBase = true AND NOW() >= start AND NOW() <= end)")
         render :json => places
       }
     end
   end
   
   def checkins
     respond_to do |format|
        format.json {
          checkins = Checkin.where('checkins.place_id = ?', params[:id]).includes(:user)
          identities_ids = checkins.map {|checkin| checkin.user.default_identity_id}
          identities = Identity.where(:id => identities_ids)
          result = checkins.map {|checkin| Array.new [checkin, identities.select{|identity| identity.user_id == checkin.user_id}]}
          render :json => result
        }
      end
   end
   
   def checkin
     respond_to do |format|
       format.json {
         checkin = current_user.checkins.build(:place_id => params[:id], :time => Time.now)
         if checkin.save
           render :json => checkin
         else
           render :status => :bad_request, :json => ""
         end
       }
     end
   end
   
end
