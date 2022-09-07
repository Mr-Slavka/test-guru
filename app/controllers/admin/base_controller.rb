
  class Admin::BaseController < ApplicationController
    layout 'admin'

    before_action :authenticate_user!
    before_action :admin_required!

    private

    def admin_required!
      redirect_to root_path, alert: 'log in as admin to view this page.' unless current_user.is_a?(Admin)
    end
  end