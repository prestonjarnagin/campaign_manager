module SessionsHelper

  def log_in(session_params)
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      return true
    else
      return false
    end
  end

end
