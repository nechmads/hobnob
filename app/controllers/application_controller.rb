class ApplicationController < ActionController::Base
  #protect_from_forgery
  
  protected
    def protect_resource 
      if request.format == "html"
        redirect_to signin_path unless user_signed_in? 
      else
        render :status => :forbidden, :json => "failed" unless user_signed_in? 
      end
    end
end
