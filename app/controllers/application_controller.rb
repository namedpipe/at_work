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
		@recent_activity = Accomplishment.recent_accomplishments
		@users = User.active_users
	end

	def refresh_everyone
		@users = User.active_users
		render :partial => "everyone"
	end

	def refresh_timeline
		@recent_activity = Accomplishment.recent_accomplishments
		render :partial => "timeline"
	end
	
	def feed
		@articles = Accomplishment.recent_accomplishments
		render :template => "application/feed.rxml", :layout => false
	end

	def admin_required
		if current_user && current_user.admin?
			true
		else
			redirect_to :action => "index", :controller => "application"
		end
	end

	private
	def authenticate_for_feed
		authenticate_or_request_with_http_basic do |user_name, password| 
			User.authenticate user_name, password
		end
	end

end
