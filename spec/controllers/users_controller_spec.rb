require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe UsersController do

#_user(stubs={})
#user ||= mock_model(User, stubs).as_null_object
#
#
# "GET index" do
#signs all users as @users" do
#.stub(:all) { [mock_user] }
#:index
#gns(:users).should eq([mock_user])
#
#
#
# "GET show" do
#signs the requested user as @user" do
#.stub(:find).with("37") { mock_user }
#:show, :id => "37"
#gns(:user).should be(mock_user)
#
#
#
# "GET new" do
#signs a new user as @user" do
#.stub(:new) { mock_user }
#:new
#gns(:user).should be(mock_user)
#
#
#
# "GET edit" do
#signs the requested user as @user" do
#.stub(:find).with("37") { mock_user }
#:edit, :id => "37"
#gns(:user).should be(mock_user)
#
#
#
# "POST create" do
#be "with valid params" do
#assigns a newly created user as @user" do
#er.stub(:new).with({'these' => 'params'}) { mock_user(:save => true) }
#st :create, :user => {'these' => 'params'}
#signs(:user).should be(mock_user)
#
#
#redirects to the created user" do
#er.stub(:new) { mock_user(:save => true) }
#st :create, :user => {}
#sponse.should redirect_to(user_url(mock_user))
#
#
#
#be "with invalid params" do
#assigns a newly created but unsaved user as @user" do
#er.stub(:new).with({'these' => 'params'}) { mock_user(:save => false) }
#st :create, :user => {'these' => 'params'}
#signs(:user).should be(mock_user)
#
#
#re-renders the 'new' template" do
#er.stub(:new) { mock_user(:save => false) }
#st :create, :user => {}
#sponse.should render_template("new")
#
#
#
#
# "PUT update" do
#be "with valid params" do
#updates the requested user" do
#er.stub(:find).with("37") { mock_user }
#ck_user.should_receive(:update_attributes).with({'these' => 'params'})
#t :update, :id => "37", :user => {'these' => 'params'}
#
#
#assigns the requested user as @user" do
#er.stub(:find) { mock_user(:update_attributes => true) }
#t :update, :id => "1"
#signs(:user).should be(mock_user)
#
#
#redirects to the user" do
#er.stub(:find) { mock_user(:update_attributes => true) }
#t :update, :id => "1"
#sponse.should redirect_to(user_url(mock_user))
#
#
#
#be "with invalid params" do
#assigns the user as @user" do
#er.stub(:find) { mock_user(:update_attributes => false) }
#t :update, :id => "1"
#signs(:user).should be(mock_user)
#
#
#re-renders the 'edit' template" do
#er.stub(:find) { mock_user(:update_attributes => false) }
#t :update, :id => "1"
#sponse.should render_template("edit")
#
#
#
#
# "DELETE destroy" do
#stroys the requested user" do
#.stub(:find).with("37") { mock_user }
#_user.should_receive(:destroy)
#te :destroy, :id => "37"
#
#
#directs to the users list" do
#.stub(:find) { mock_user }
#te :destroy, :id => "1"
#onse.should redirect_to(users_url)
#
#

  describe "GET 'nearby'" do
    it "should return forbidden for non loged in users and json request" do
      get :nearby, :format => :json
      response.response_code.should == 403
    end
    
    describe "it should give access to logged on users" do
      before(:each) do
        @identities = Array.new
        2.times do
          @identity = Factory(:identity)
          @identity.user.update_attributes(:default_identity_id => @identity.id)
          @identities << @identity
        end
        
        @far_identity = Factory(:identity)
        @far_identity.user.update_attributes(:default_identity_id => @far_identity.id, :lat => "37.787", :lng => "-121.64")
        
        @userIdentity = Factory(:identity)
        @userIdentity.user.update_attributes(:default_identity_id => @userIdentity.id, :lat => "37.79417", :lng => "-122.395")
        sign_in @userIdentity.user
      end
      
      it "should return list of just the nearby users" do        
        get :nearby, :format => :json
        response.body.should == ActiveSupport::JSON.encode(@identities)
      end
    end
  end
end
