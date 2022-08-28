
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    protect_from_forgery with: :exception

    helper_method :current_user, :logged_in?

    private

    def authenticate_user!
      return if current_user

      cookies[:requested_path] = request.url
      flash[:alert] = 'Verify your email and password'
      redirect_to login_path
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      current_user.present?
    end

  end
