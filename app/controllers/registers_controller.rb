class RegistersController<PublicController

  def signup
    @signup = true
    @user = User.new
    render :template => 'users/signup'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_project_path
    else
      render 'users/signup'
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
