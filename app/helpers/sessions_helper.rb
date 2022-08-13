
  module SessionsHelper
    def flash_message
      render inline: "<% flash.each do |key, message| %> <p class= 'flash <%= key %>'><%= message %></p><% end %>"
    end
  end
