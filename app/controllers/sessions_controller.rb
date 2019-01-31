class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Valid login
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end

  def new; end

  def destroy; end
end
