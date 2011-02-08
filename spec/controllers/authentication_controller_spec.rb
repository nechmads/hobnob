require 'spec_helper'

describe AuthenticationController do  
  describe "managing users based on linkedin id" do
    it "should create a new user with a new linkedin_id" do
      expect {
        post :create, :linkedin_id =>"newLinkedinId"
      }.to change(User, :count).by(1)
    end
    
    it "should return the new user" do
      post :create, :linkedin_id =>"newLinkedinId"
      @user = assigns(:user)
      response.body.should == ActiveSupport::JSON.encode(@user)
    end
    
    it "should not create a new user when the same linkedin already exist" do
      post :create, :linkedin_id =>"newLinkedinId"
      expect {
        post :create, :linkedin_id =>"newLinkedinId"
      }.to_not change(User, :count)
    end
    
    it "should login the user" do
      post :create, :linkedin_id =>"newLinkedinId"
      @user = assigns(:user)
      response.body.should == ActiveSupport::JSON.encode(@user)
    end
  end
  
end
