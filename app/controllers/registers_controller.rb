class RegistersController<ApplicationController

  def signup
    @user = User.new
    render :template => 'users/signup'
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password_digest))
    p 'IT hit create'
    if @user.save
      p 'if was true'
      session[:user_id] = @user.id
      redirect_to main_path
    end
  end

end
