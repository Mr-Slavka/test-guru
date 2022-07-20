class User < ApplicationRecord

  has_many :user_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def tests_by_level(search_level)
    tests.by_level(search_level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
