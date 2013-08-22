class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  helper_method :current_user
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private
  

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def signed_in
  if current_user.nil?
    store_location
    flash[:error] = "Please sign to view this page"
    redirect_to log_in_path
   end
  end
  
  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_back_or(current_user)
      flash[:error] = "Not authorized to view this page"
    end
  end
end
