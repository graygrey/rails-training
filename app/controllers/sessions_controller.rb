class SessionsController < ApplicationController
  def new
    if signed_in?
      redirect_to articles_url
    end
  end

  def create
    user = User.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error]="invalid username and password combination"
      redirect_to new_session_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
