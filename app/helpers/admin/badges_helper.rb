
  module Admin::BadgesHelper
    def badges_rules
      BadgesService::RULES.map(&:to_s)
    end
  end