class FeedsController < ApplicationController
  def index
    @feeds = InstaFeed.new(session[:access_token]).list
  end
end
