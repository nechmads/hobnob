require 'spec_helper'

describe MessagesController do
  describe "trying to access protected resources when not logged in" do
    it "should not give access to inbox" do
      get :inbox, :format => :json
      response.response_code.should == 403
    end 
  end
  
  describe "accessing messages as a signed in user" do
    before(:each) do
      @user = Factory(:user)
      sign_in @user
    end
    
    describe "GET 'inbox'" do
      before(:each) do
        sender_user = Factory(:user)
        @messages = Array.new
        @extra_messages = Array.new
        10.times do
          message = Factory(:message, :sender_id => sender_user.id, :recipient_id => @user.id)
          @messages << message
        end
        10.times do
          message = Factory(:message, :sender_id => sender_user.id, :recipient_id => @user.id)
          @extra_messages << message
        end
      end
      it "should return the messages of the current user" do
        get :inbox, :format => :json
        response.body.should == ActiveSupport::JSON.encode(@messages)
      end
      
      it "should return just the amount of messages specified"
      
      it "should return the next batch of messages" do
        get :inbox, :format => :json, :count => 10, :page => 1
        response.body.should == ActiveSupport::JSON.encode(@extra_messages)
      end
    end
    
    describe "GET 'outbox'" do
      before(:each) do
        sender_user = Factory(:user)
        @messages = Array.new
        @extra_messages = Array.new
        20.times do
          message = Factory(:message, :sender_id => @user.id, :recipient_id => sender_user.id)
          @messages << message
        end
       
      end
      it "should return the messages of the current user" do
        get :outbox, :format => :json
        response.body.should == ActiveSupport::JSON.encode(@messages[0..9])
      end
      
      it "should return just the amount of messages specified" do
        get :outbox, :format => :json, :count => 5
        response.body.should == ActiveSupport::JSON.encode(@messages[0..4])
      end
      
      it "should return the next batch of messages" do
        get :outbox, :format => :json, :count => 10, :page => 1
        response.body.should == ActiveSupport::JSON.encode(@messages[10..19])
      end
    end
  end
end
