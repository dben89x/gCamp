class AuthenticatesController < ApplicationController

  def signin
    @signin = true
    @user = User.new
    render :template => 'users/signin'
  end

  def create
    @user = User.find_by_email(params[:email])
    p "USER"
    p @user
    if @user && @user.authenticate(params[:password_digest])
      session[:user_id] = @user.id
      redirect_to main_path
    else
      @sign_in_error = "Username / password combination is invalid"
      # redirect_to users_path
    end
  end

  def destroy
    session.clear
    redirect_to main_path
  end

end
