class TwitterController < ApplicationController
  respond_to :html, :only => [:index]
  respond_to :json, :only => [:index]
  
  helper_method :tweets
  
  def index
    respond_with tweets
  end

private
  def tweets
    @tweets ||= HTTParty.get("http://api.twitter.com/1/statuses/user_timeline.json?screen_name=macasek&count=5&include_rts=true") 
  end
end