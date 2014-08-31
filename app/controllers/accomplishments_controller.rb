class AccomplishmentsController < ApplicationController
  before_filter :login_required
  # GET /accomplishments
  # GET /accomplishments.json
  def index
    @accomplishments = Accomplishment.where("user_id = :user_id", {:user_id => params[:user_id]})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @accomplishments }
    end
  end

  # GET /accomplishments/1
  # GET /accomplishments/1.json
  def show
    @accomplishment = Accomplishment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @accomplishment }
    end
  end

  # GET /accomplishments/new
  # GET /accomplishments/new.json
  def new
    @accomplishment = Accomplishment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @accomplishment }
    end
  end

  # GET /accomplishments/1/edit
  def edit
    @accomplishment = Accomplishment.find(params[:id])
  end

  # POST /accomplishments
  # POST /accomplishments.json
  def create
    @accomplishment = Accomplishment.new(params[:accomplishment])
    @accomplishment.user = current_user

    @user = current_user
    @user.accomplishments.create(:accomplishment => params[:add_accomplishment])
    @users = User.active_users
    @recent_activity = Accomplishment.recent_accomplishments

    respond_to do |format|
      if @accomplishment.save
        @recent_activity = Accomplishment.recent_accomplishments
        format.html { redirect_to user_accomplishment_url(current_user, @accomplishment), :notice => 'Accomplishment was successfully created.' }
        format.js { render :status => :created }
        format.json { render :json => @accomplishment, :status => :created }
      else
        format.html { render :action => "new" }
        format.json { render :json => @accomplishment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accomplishments/1
  # PUT /accomplishments/1.json
  def update
    @accomplishment = Accomplishment.find(params[:id])

    respond_to do |format|
      if @accomplishment.update_attributes(params[:accomplishment])
        format.html { redirect_to @accomplishment, :notice => 'Accomplishment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @accomplishment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accomplishments/1
  # DELETE /accomplishments/1.json
  def destroy
    @accomplishment = Accomplishment.find(params[:id])
    @accomplishment.destroy

    respond_to do |format|
      format.html { redirect_to accomplishments_url }
      format.json { head :no_content }
    end
  end
end
