class User < ApplicationRecord

  has_many :user_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :tests, through: :stories

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def tests_by_level(search_level)
    tests.by_level(search_level)
  end
end
