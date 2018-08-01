class AdminsController < ApplicationController

  private

  def admin_params
    params.require(:admin).permit(:username, :password, :password_confirmation)
  end
end
