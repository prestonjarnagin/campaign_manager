class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :set_current_user

  def current_user
    @current_user ||= User.find_by(id: uid) if uid
  end

  def set_current_user(user_id)
    session[:user_id] = user_id
  end

  def require_login
    unless current_user
      render_404
    end
  end

  private

  def render_404
    render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
  end

  def uid
    session[:user_id]
  end
end
