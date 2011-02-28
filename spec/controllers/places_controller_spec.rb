require 'spec_helper'

describe PlacesController do
  before(:each) do
    @places = Array.new
    2.times do
      place = Factory(:place)
      @places << place
    end
    2.times do
      place = Factory(:place, :start => Time.new + 10.days)
    end
    2.times do
      place = Factory(:place, :isTimeBase => false)
      @places << place
    end
  end
  
  describe "should block access to protected resources" do
    it "should bloc access to index method" do
      get :index, :format => :json
      response.response_code.should == 403
    end
    
    it "should block access to checkins method" do
      get :checkins, :format => :json, :id => 1
      response.response_code.should == 403
    end
  end
  
  describe "GET 'index'" do
    before(:each) do
      user = Factory(:user)
      sign_in user
    end
    
    it "should return all the places which are currently running" do
      get :index, :format => :json
      response.body.should == ActiveSupport::JSON.encode(@places)
    end
  end
  
  describe "GET 'checkins" do
    before(:each) do
      @identity = Factory(:identity)
      @identity.user.default_identity_id = @identity.id
      @identity.user.save
      sign_in @identity.user
      
      @checkins = Array.new
      @identities = Array.new
      2.times do
       checkin = Factory(:checkin, :place => @places[0], :user => @identity.user)
       @checkins << checkin
       @identities << @identity
      end 
    end
     
    pending "should return all checkins for this place" 
      #get :checkins, :format => :json, :id => @checkins[0].place_id
      #response.body.should == ActiveSupport::JSON.encode(@identities)
    #end
  end
  
end
