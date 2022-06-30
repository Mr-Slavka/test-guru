
  class Test < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'
    belongs_to :category

    has_many :questions, dependent: :destroy
    has_many :stories, dependent: :destroy
    has_many :users, through: :stories, dependent: :destroy


    def self.tests_by_category(category)
      joins('JOIN categories ON tests.category_id = categories.id')
        .order(id: :desc)
        .where('categories.title = :category', category: category)
        .pluck(:title)
    end
  end
