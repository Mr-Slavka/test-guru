class RenameTestsUserIdColumnName < ActiveRecord::Migration[6.0]
  def change
    change_table :tests do |t|
      t.remove :user_id
      t.references :author, foreign_key: { to_table: :users }, null: false
    end
  end
end
