class User < ApplicationRecord

  require 'digest/sha1'

  has_many :user_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  has_secure_password

  validates :name, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_by_level(search_level)
    tests.by_level(search_level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
