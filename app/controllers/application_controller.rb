class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :set_locale

  protect_from_forgery with: :exception


  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
  end

  private

  def after_sign_in_path_for(resource)
    resource.admin? ? admin_tests_path : root_path
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
