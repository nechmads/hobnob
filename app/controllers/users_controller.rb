class UsersController < ApplicationController
  before_filter :protect_resource, :only => [ :nearby ]
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @found = Location.within(0.1, :origin => [37.794,-122.395]).first
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def location
    respond_to do |format|
      format.json {
        if current_user.update_attributes(:lng => params[:lng], :lat => params[:lat], :last_location_update_time => Time.now)
          render :json => current_user
        else
          render :status => :bad_request, :json => ""
        end
      }
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  def nearby
    respond_to do |format|
      format.json {
        if (params["lat"] != nil && params[lng] != nil)
          current_user.update_attributes(:lat => params["lat"], :lng => params[lng], :last_location_update_time => Time.now)
        end
        
        @near_by_users = User.within(10, :origin => current_user).all
        @identities = Array.new
        @near_by_users.each do |user|
          if user.id != current_user.id
            curr_result = Array.new
            curr_result << user
            curr_result << Identity.find(user.default_identity_id)
            @identities << curr_result
          end
        end
        #@identities = @near_by_users.map {|user| user.id == current_user.id ? nil : Identity.find(user.default_identity_id)  }
        render :json => @identities.compact
      }
    end
  end
end
