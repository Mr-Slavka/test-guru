
  class Test < ApplicationRecord
    belongs_to :user
    belongs_to :category

    def self.tests_by_category(category)
      joins('JOIN categories ON tests.category_id = categories.id')
        .order(id: :desc)
        .where('categories.title = :category', category: category)
        .pluck(:title)
    end
  end
