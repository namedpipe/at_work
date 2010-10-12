# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.action_controller.session = {
    :session_key => '_at_work_session',
    :secret      => 'c1b8a800c78dec17114c6c7ae90b06e2fbdfa9e1d59d3bda1a04a68f58ceb58804847ee8939e12a4027ad6efd1a8019a5418cdff3e9a28e08c9a2e1957ff6395'
  }
	config.gem 'shoulda'
end

ORGANIZATION = "My Company"
