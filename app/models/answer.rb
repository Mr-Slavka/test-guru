class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_count_responses, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_count_responses
    errors.add(:number_of_responses, 'Questions must have max. 4 answers.') if question.answers.count >= 4
  end
end
