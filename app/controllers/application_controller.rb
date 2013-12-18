class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :authorize  #call method authorize below

  def authorize
    redirect_to new_session_path unless current_user  #call method curent_user in sessions_helper
  end

end
