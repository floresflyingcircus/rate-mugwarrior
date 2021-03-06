class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
private
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    klass.new(object, view_context)
  end
  
  def current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user = User.first
  end
  
  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end
