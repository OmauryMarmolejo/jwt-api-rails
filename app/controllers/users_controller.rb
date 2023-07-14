class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  # GE /users
  def index
    @users = User.all

    render json: @users, status: :ok
  end

  def show
    @user = find(params[:id])
  end

  def create
    if @user.save
      render son: @user, status: :created
  else
    render json: @user.errors, status: :unprocessable_entity
  end

  def destroy
    @user.destroy

    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
