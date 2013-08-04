class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_filter :verify_signed_in

  private

    def verify_signed_in
      redirect_to need_session_path unless current_user
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
end
