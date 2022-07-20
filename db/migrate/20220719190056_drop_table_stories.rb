class DropTableStories < ActiveRecord::Migration[6.0]
  def up
    drop_table :stories, if_exists: true
  end
end
