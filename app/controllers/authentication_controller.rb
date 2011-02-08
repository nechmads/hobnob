class AuthenticationController < ApplicationController
  def create
    @user = User.new(:linkedin_id => params['linkedin_id'],
                     :password => "password",
                     :email => "my@email.com")
    
    found_user = User.find_by_linkedin_id(params['linkedin_id'])
    logger.debug found_user
    if found_user == nil
      @user.first_name = params["first_name"]
      @user.last_name = params["last_name"]
      if @user.save
        sign_in @user
        render :json => current_user
      else
        render :status => :bad_request, :text => ""
      end
    else
      sign_in found_user
      render :json => current_user
    end
  end
end
