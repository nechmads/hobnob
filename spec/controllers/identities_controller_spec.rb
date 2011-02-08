require 'spec_helper'

describe IdentitiesController do
  describe "trying to access protected resources when not logged in" do
    it "should deny access to create a new identity" do
      post :create, :format => :json
      response.response_code.should == 403
    end
    
    it "should deny access to getting all identities" do
      get :index, :format => :json
      response.response_code.should == 403
    end
    
    it "should deny access to update an identity" do
      @identity1 = Factory(:identity)
      put :update, :format => :json, :id => @identity1
      response.response_code.should == 403
    end
  end
  
  describe "POST 'create'" do
    it "should create a new identity for a json call" do
      @attr = { :identity_name => "newName", :email => "me@bla.com" }
      @user = Factory(:user)
      sign_in @user
      post :create, { :format => :json, :identity => @attr }
      response.response_code.should == 200
    end
  end
  
  describe "access under a logged in user" do
    before(:each) do
      @identity = Factory(:identity)
      sign_in @identity.user
    end
    
    describe "GET 'index'" do
      it "should return the identities of the current user for a json call" do
        @identity2 = Factory(:identity, :user_id => @identity.user_id)      
        get :index, :format => :json
        response.body.should == ActiveSupport::JSON.encode(@identity.user.identities)
      end
    end
  
    describe "PUT 'update'" do
      before (:each) do
        @attr = { :identity_name => "new name", :email => "newemail@email.com" }
      end
      
      it "should update the identity" do  
        put :update, :format => :json, :id => @identity.id, :identity => @attr
        identity = assigns(:identity)
        @identity.reload
        @identity.identity_name.should == identity.identity_name
        @identity.email.should == identity.email
      end
      
      it "should return the updated identity" do
        put :update, :format => :json, :id => @identity.id, :identity => @attr
        @identity.reload
        response.body.should == ActiveSupport::JSON.encode(@identity)
      end
    end
  end
end
