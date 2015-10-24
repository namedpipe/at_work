# This controller handles the login/logout function of the site.
class LoginController < ApplicationController
  skip_before_filter :login_required
  # render new.rhtml
  def new
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      flash[:notice] = nil
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { value: current_user.remember_token, expires: current_user.remember_token_expires_at }
      end
      redirect_back_or_default('/')
    else
      flash[:notice] = "Incorrect login"
      render action: 'new'
    end
  end

  def destroy
    current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
end
