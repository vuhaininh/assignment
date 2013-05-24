module SessionsHelper
  #WHen signing in user, save remember token to coookie
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end
  #Check if user is signed in
  def signed_in?
    !current_user.nil?
  end
  #Sign out and delete remember token
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  #Assignment to assignt current user
  def current_user=(user)
    @current_user = user
  end
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  def current_user?(user)
    user == current_user
  end
  
  private
  def signed_in_user
	  store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end
  
  #Redirect to location
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
  def store_location
    session[:return_to] = request.url
  end
end
