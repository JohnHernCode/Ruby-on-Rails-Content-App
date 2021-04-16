class ApplicationController < ActionController::Base
  include SessionsHelper
  helper_method :set_current_user
  before_action :set_nav_categories

  def set_current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    else
      @current_user = nil
    end
  end

  def set_nav_categories
    @nav_categories = Category.order(:priority).limit(4)
  end

  private

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end
end
