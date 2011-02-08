require 'spec_helper'

describe User do
  it "should create a new user with just a linkedin user id" do
    @user = User.new({:linkedin_id => 'newLinkedInId', :email => 'newLinkedInId@email.com', :password => "password"})
    @user.should be_valid
  end
end
