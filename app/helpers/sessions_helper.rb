module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end
  def log_out
    session.delete(:user_id)
  end
end  