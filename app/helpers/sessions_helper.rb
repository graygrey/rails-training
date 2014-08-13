module SessionsHelper
  def sign_in(user)
    #remember_token = User.new_remember_token
    #cookies.permanent[:remember_token] = remember_token
    #logger.debug "new remember_token: #{remember_token}"
    #user.update_attribute(:remember_token, User.hash(remember_token))
    #self.current_user = user
    #logger.debug "Current User remember_token: #{user.remember_token}"
    cookies.permanent[:id]=user.id
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    #remember_token = User.hash(cookies[:remember_token])
    #logger.debug "remember_token: #{remember_token}"
    id = cookies[:id]
    @current_user ||= User.find_by(id: id)
  end

  def correct_user?(user)
    user == current_user
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    #current_user.update_attribute(:remember_token, User.hash(User.new_remember_token))
    self.current_user = nil
    cookies.delete(:id)
  end

end
