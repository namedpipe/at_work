class ApplicationController < ActionController::Base
	include AuthenticatedSystem
	helper :all # include all helpers, all the time
	before_filter :login_required, :except => [ :feed ]
	before_filter :authenticate_for_feed, :only => [ :feed ]
	# See ActionController::RequestForgeryProtection for details
	# Uncomment the :secret if you're not using the cookie session store
	protect_from_forgery # :secret => '9460e80227624f6f1a18e39ff622ad2e'

	def index
		@user = current_user
		@user.current_status ||= "Update your current status and save"
		@recent_activity = Accomplishment.find(:all, :conditions => ["created_at > ?", 9.days.ago], :order => "created_at DESC")
		@users = User.find(:all, :conditions => "current_status is not null", :order => "first_name")
	end

	def refresh_everyone
		@users = User.find(:all, :conditions => "current_status is not null", :order => "first_name")
		render :partial => "everyone"
	end

	def refresh_timeline
		@recent_activity = Accomplishment.find(:all, :conditions => ["created_at > ?", 9.days.ago], :order => "created_at DESC")
		render :partial => "timeline"
	end

	def add_accomplishment
		@user = current_user
		@user.accomplishments.create(:accomplishment => params[:add_accomplishment])
		@users = User.find(:all, :conditions => "current_status is not null", :order => "first_name")
		@recent_activity = Accomplishment.find(:all, :conditions => ["created_at > ?", 9.days.ago], :order => "created_at DESC")
	end
	
	def set_user_current_status
		@user = current_user
		@user.current_status = params[:value]
		@user.save
		@user.accomplishments.create(:accomplishment => "Changed Status: #{params[:value]}")
		@users = User.find(:all, :conditions => "current_status is not null", :order => "first_name")
		@recent_activity = Accomplishment.find(:all, :conditions => ["created_at > ?", 9.days.ago], :order => "created_at DESC")
		render :text => @user.current_status
	end
	
	def feed
		@articles = Accomplishment.find(:all, :conditions => ["created_at > ?", 9.days.ago], :order => "created_at DESC")
		render :template => "application/feed.rxml", :layout => false
	end

	private
	def authenticate_for_feed
		authenticate_or_request_with_http_basic do |user_name, password| 
			User.authenticate user_name, password
		end
	end

end
