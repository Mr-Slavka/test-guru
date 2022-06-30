class User < ApplicationRecord

  has_many :user_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :tests, through: :stories, dependent: :destroy

  def tests(level)
    Test.joins('JOIN stories ON tests.id = stories.test_id')
        .where('stories.user_id = :id  AND level =  :level', id: id, level: level)
  end
end
