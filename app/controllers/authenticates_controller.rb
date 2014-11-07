class AuthenticatesController < ApplicationController

  def signin
    @signin = true
    render template: 'users/signin'
  end

  def create
    @user = User.find_by_email(params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to main_path
    else
      @sign_in_error = "Username / password combination is invalid"
      render 'users/signin'
    end
  end

  def destroy
    session.clear
    redirect_to main_path
  end

end
