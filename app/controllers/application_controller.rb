class ApplicationController < ActionController::Base

# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  @current_page
  def current_user
    User.find_by(id: session[:user_id])
  end

  helper_method :current_user

  before_action :ensure_logged_in

  class AccessDenied < StandardError
  end
  rescue_from AccessDenied, with: :record_not_found

  private

  def ensure_logged_in
    unless current_user
      redirect_to signin_path, notice: 'You must be logged in to see this page'
    end
  end

  def record_not_found
    render "public/404", status: 404, layout: false
  end
end
