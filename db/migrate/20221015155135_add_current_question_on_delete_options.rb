class AddCurrentQuestionOnDeleteOptions < ActiveRecord::Migration[6.0]
  def change
    change_table :test_passages do |t|
      t.remove :current_question_id
      t.references :current_question, null: true, foreign_key: { to_table: :questions, on_delete: :cascade }
    end
  end
end
