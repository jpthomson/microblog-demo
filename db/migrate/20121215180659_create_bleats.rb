class CreateBleats < ActiveRecord::Migration
  def change
    create_table :bleats do |t|
      t.text :content
      t.references :user

      t.timestamps
    end
    add_index :bleats, :user_id
  end
end
