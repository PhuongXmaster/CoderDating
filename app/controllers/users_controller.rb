class UsersController < ApplicationController

  before_action :require_login, only: [:index]
  before_action :skip_if_logged_in, only: [:login]

  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to welcome_index_path
    end
  end

  def login

  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
