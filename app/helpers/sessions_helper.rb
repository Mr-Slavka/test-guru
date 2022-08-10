
  module SessionsHelper
    def flash_message
      render 'shared/flashes' if flash.present?
    end
  end
