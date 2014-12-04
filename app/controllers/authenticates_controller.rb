class AuthenticatesController < PublicController

  def signin
    @signin = true
    render template: 'users/signin'
    p @current_page
  end

  def create
    @user = User.find_by_email(params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if !@current_page
        redirect_to projects_path

      end
    else
      @sign_in_error = "Username / password combination is invalid"
      render 'users/signin'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
