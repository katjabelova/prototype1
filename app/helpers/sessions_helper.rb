module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    user_role
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def user_role
    if logged_in?
      @role_id = UserRole.find_by(user_id: @current_user).role_id
      puts "role id found: " + @role_id.to_s
    else
      @role_id = 2
    end
  end

end
