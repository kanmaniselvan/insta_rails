class UsersController < ApplicationController
  skip_before_action :require_login, only: :home

  def home
    if user_signed_in?
      redirect_to feeds_path
    end
  end
end
