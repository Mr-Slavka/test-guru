
  class Gist < ApplicationRecord
    belongs_to :user
    belongs_to :question

    validates :gist_url, presence: true

    def url_hash
      URI(gist_url)
    end
  end
