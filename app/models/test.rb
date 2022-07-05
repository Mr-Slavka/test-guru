
  class Test < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'
    belongs_to :category

    has_many :questions, dependent: :destroy
    has_many :stories, dependent: :destroy
    has_many :users, through: :stories

    validates :title, presence: true,
                      uniqueness: { scope: %i[level title] }
    validates :level, numericality: { only_integer: true, greater_than: 0 }

    scope :easy_lvl, -> { where(level: 0..1) }
    scope :medium_lvl, -> { where(level: 2..4) }
    scope :hard_lvl, -> { where(level: 5..Float::INFINITY) }
    scope :by_level, ->(value) { where(level: value) }
    scope :by_category, ->(category) { joins(:category).order(id: :desc).where(categories: { title: category }) }


    def self.tests_by_category(category)
      by_category(category).pluck(:title)
    end
  end
