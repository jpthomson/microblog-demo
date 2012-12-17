class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :screen_name
      t.string :avatar_url
      t.text :bio

      t.timestamps
    end
    add_index :users, :email, :unique => true
  end
end
