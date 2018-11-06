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

  def session_user
    if logged_in?
      puts "logged in"
      user_id = @current_user.id
    else
      @timeset_millis = Time.now.to_f
      @default_user = 'default' + @timeset_millis.to_s
      user_id = @default_user
    end
  end

  def session_time
    @timeset = DateTime.now.to_s
    @timeset = @timeset.gsub(':', '-')
  end

  def session_file
    combinedTimeUser = session_time + '_' + session_user.to_s
    @filename = Rails.root + "protocol/protocols/" + combinedTimeUser
  end

  @session_complete = false


end
