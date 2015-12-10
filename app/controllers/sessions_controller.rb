class SessionsController < ActionController::Base
  def create
    @user = User.find_by_email(params[:user][:email])

    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to welcome_login_path
    end
  end
end