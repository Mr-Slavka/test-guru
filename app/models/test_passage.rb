class TestPassage < ApplicationRecord
  SUCCESS_RATIO = 0.85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  scope :successful, -> { where(successful: true) }

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.successful = true if pass?
    save!
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question_id).count + 1
  end

  def pass?
    correct_questions / test.questions.count >= SUCCESS_RATIO
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if test.present? && current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
