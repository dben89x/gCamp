class RegistersController<ApplicationController

  def signup
    @signup = true
    @user = User.new
    render :template => 'users/signup'
  end
# Rails.logger.debug(params.inspect)
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to main_path
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password_digest, :password_confirmation)
  end

end
