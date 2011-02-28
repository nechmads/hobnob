require 'spec_helper'

describe EventsController do
  describe "trying to access protected resources when not logged in" do
    it "should block access to GET 'index'" do
      get :index, :format => :json
      response.response_code.should == 403
    end
  end
  
  describe "accessing resources with a logged in user" do
    before(:each) do
      user = Factory(:user)
      sign_in user
    end
    
    describe "GET 'index'" do
      before(:each) do
        @sxsw_events = Array.new
        @web2_events = Array.new
      end
      
      it "should not return any events for query without a collection" do
        4.times do
          event = Factory(:event, :collection => 1, :track => 1)
          @sxsw_events << event
        end
        
        get :index, :format => :json
        response.body.should == "null"
      end
      
      it "should return all the events of the collection" do
        4.times do
          event = Factory(:event, :collection => 1, :track => 1)
          @sxsw_events << event
        end
        4.times do
          event = Factory(:event, :collection => 2, :track => 1)
          @web2_events << event
        end
        
        get :index, :format => :json, :collection => 2
        response.body.should == ActiveSupport::JSON.encode(@web2_events)
      end
      
      it "should return just the events of the specific track" do
        4.times do
          event = Factory(:event, :collection => 1, :track => 1)
          @sxsw_events << event
        end
        4.times do
          event = Factory(:event, :collection => 1, :track => 2)
          @web2_events << event
        end
        
        get :index, :format => :json, :track => 2
        response.body.should == ActiveSupport::JSON.encode(@web2_events)
      end
    end
    
  end
end
