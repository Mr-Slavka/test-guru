
  class Test < ApplicationRecord
    belongs_to :user
    belongs_to :category

    def self.tests_by_category(category)
      category_id = Category.where(title: category).pluck(:id)
      Test.order(id: :desc).where(category_id: category_id).pluck(:title)
    end
  end
