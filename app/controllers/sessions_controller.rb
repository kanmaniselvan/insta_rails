class SessionsController < ApplicationController
  skip_before_action :require_login

  def create
    @user = User.find_or_save_from_auth(request.env['omniauth.auth'])
    session[:user_id] = @user.id

    redirect_to feeds_path
  end

  def destroy
    session[:user_id] = nil

    flash[:success] = 'Logged out successfully'
    redirect_to root_path
  end
end
