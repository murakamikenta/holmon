module Api::SessionsHelper
  def sign_in(user)
    access_token = User.new_access_token
    cookies.permanent[:access_token] = access_token
    user.update_attribute(:access_token, User.encrypt(access_token))
    self.current_user = user
    access_token
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    access_token = User.encrypt(cookies[:access_token])
    @current_user ||= User.find_by(access_token: access_token)
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    access_token = User.new_access_token
    user.update_attribute(:access_token, User.encrypt(access_token))
    self.current_user = nil
    cookies.delete(:access_token)
  end
    
end
