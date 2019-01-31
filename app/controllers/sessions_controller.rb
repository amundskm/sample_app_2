class SessionsController < ApplicationController
  def create
    user = User.find_by(emai: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    else
      flash.now[:danger] = "invalid email/password combination"
      render 'new'
    end
  end

  def new
  end

  def destroy
  end

end
