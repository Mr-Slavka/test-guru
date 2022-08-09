
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user!, except: :destroy

    def new; end

    def create
      user = User.find_by(email: params[:email])

      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to cookies.delete(:requested_path) || root_path
      else
        flash.now[:alert] = 'Enter correct password and/or email'
        render :new
      end
    end

    def destroy
      session.delete(:user_id)
      @current_user = nil
      redirect_to login_path
    end
  end
