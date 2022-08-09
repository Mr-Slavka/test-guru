
  module SessionsHelper
    def show_flash(type)
      content_tag(:p, flash[type], class: "flash #{type}") if flash[type]
    end
  end
