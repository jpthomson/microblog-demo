class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.references :user
      t.references :auth_provider
      t.string :uid

      t.timestamps
    end
    add_index :authorizations, :user_id
    add_index :authorizations, :auth_provider_id
  end
end
