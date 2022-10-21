
  class Badge < ApplicationRecord
    has_many :badges_users, dependent: :destroy
    has_many :users, through: :badges_users

    validates :title, presence: true
    validates :image, presence: true
  end
