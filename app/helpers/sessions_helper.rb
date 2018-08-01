module SessionsHelper

  def login(admin)
    cookies[:remember_token] = admin.remember_token
    self.current_user = admin
  end

  def current_user=(admin)
    @current_user = admin
  end

  def current_user
    @current_user ||= Admin.find_by_remember_token(cookies[:remember_token])
  end

  def logged_in?
    !self.current_user.nil?
  end

  def logged_in_user
    if !logged_in?
      redirect_to login_path,
                  alert: 'Sorry, you need to be logged in to access that page.'
    end
  end

  def logout
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
