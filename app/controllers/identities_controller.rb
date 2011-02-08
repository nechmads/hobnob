class IdentitiesController < ApplicationController 
  before_filter :protect_resource
  
  def create
    respond_to do |format|
      format.json {
        @identity = current_user.identities.build(params[:identity])
        if @identity.save
          render :json => @identity
        else
          render :status => :bad_request, :json => ""
        end
      }
      format.html { render :text => "html" }
      format.xml { render :xml => "xml" }
    end
  end
  
  def index
    respond_to do |format|
      format.json {
        identities = current_user.identities
        identities.each do |identity|
          identity.qr_url = "http://chart.apis.google.com/chart?chs=200x200&cht=qr&chl=http://code.google.com/apis/chart/image_charts.html"
        end
        render :json => identities
      }
    end
  end
  
  def update
    respond_to do |format|
      format.json {
        @identity = Identity.find(params[:id])
        if @identity.update_attributes(params[:identity])
          @identity.qr_url = "http://chart.apis.google.com/chart?chs=200x200&cht=qr&chl=http://code.google.com/apis/chart/image_charts.html"
          render :json => @identity
        else
          render :status => :bad_request, :json => ""
        end
      }
    end
  end
  
  protected
    def protect_resource 
      if request.format == "html"
        redirect_to signin_path unless user_signed_in? 
      else
        render :status => :forbidden, :json => "failed" unless user_signed_in? 
      end
    end
end
