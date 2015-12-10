class SessionsController < ActionController::Base
  def create
    @user = User.find_by_email(params[:user][:email])

    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome back!"
      redirect_to users_path
    else
      flash[:error] = "Email or password is incorrect!"
      redirect_to welcome_login_path
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You have been logged out!"
    redirect_to welcome_index_path
  end
end