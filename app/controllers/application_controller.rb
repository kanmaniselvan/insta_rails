class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :user_signed_in?
  before_action :require_login

  def require_login
    unless user_signed_in?
      flash[:error] = 'Please login before proceeding'

      redirect_to root_url
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !!current_user
  end
end
