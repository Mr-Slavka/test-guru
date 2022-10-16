class AddPublishedToTest < ActiveRecord::Migration[6.0]
  def change
    change_table :tests do |t|
      t.boolean :published, default: false, null: false
    end
  end
end
