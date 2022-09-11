class RemNameAndAdminColumnInUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.remove :name
      t.remove :admin
    end
  end
end
