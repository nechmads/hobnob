class AuthenticationController < ApplicationController
  def create
    found_user = User.find_by_linkedin_id(params['linkedin_id'])
        
    if found_user == nil
       @user = User.new(:linkedin_id => params['linkedin_id'],
                         :encrypted_password => "password",
                         :email => "my@email.com")
                         
      @user.first_name = params["first_name"]
      @user.last_name = params["last_name"]
      @user.reset_authentication_token
      if @user.save
        sign_in @user
        user_json = ActiveSupport::JSON.decode(params['user'])
        default_identity = create_default_identity(user_json['identity'][0]) unless params['user'] == nil
        @user.update_attribute(:default_identity_id, default_identity.id)
        render :json => current_user
      else
        render :status => :bad_request, :text => ""
      end
    else
      sign_in found_user
      render :json => current_user
    end
  end
  
  private
    def create_default_identity(identity_data)
      new_identity = current_user.identities.new
      new_identity.identity_name = "Default Identity"
      new_identity.first_name = identity_data['first_name']
      new_identity.last_name = identity_data['last_name']
      new_identity.twitter = identity_data['twitter']
      new_identity.company_name = identity_data['current_position']['company_name'] ||= ""
      new_identity.title = identity_data['current_position']['title'] ||= ""
      new_identity.industry = identity_data['current_position']['industry'] ||= ""
      
      new_identity.save
      new_identity
    end
end
