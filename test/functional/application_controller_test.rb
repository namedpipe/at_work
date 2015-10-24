require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  tests ApplicationController
  fixtures :users, :accomplishments

  context "on GET to index" do
    setup { get :index }
    should_respond_with :redirect
  end

  context "on GET to index with a user" do
    setup do
      @user = User.find 1
      @request.session[:user_id] = @user.id
      get :index
    end
    should_respond_with :success
  end

  context "on GET to index with a user" do
    setup do
      @user = User.find 1
      @request.session[:user_id] = @user.id
      get :index
    end
    should_respond_with :success
  end
end
