class ApplicationController < ActionController::Base

# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  @current_page
  def current_user
    User.find_by(id: session[:user_id])
  end

  helper_method :current_user

  before_action :authorize

  class AccessDenied < StandardError
  end

  private

  def authorize
    unless current_user
      redirect_to signin_path, notice: 'You must be logged in to see this page'
    end
  end
end
