class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @new_user = true
  end

  def edit
    @edit_user = true
  end

  def show
    @show_user = true
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path, notice: 'User was successfully created'
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user), notice: 'User was successfully updated'
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
