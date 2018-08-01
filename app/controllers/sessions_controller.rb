class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(username: params[:session][:username])
    if admin && admin.authenticate(params[:session][:password])
      login admin
      redirect_to root_path,
                  notice: 'You are now logged in!'
    else
      flash.now.alert = 'Invalid login credentials. Contact Site Admin if you forgot your credentials.'
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_path,
                notice: 'You have been logged out successfully!'
  end
end