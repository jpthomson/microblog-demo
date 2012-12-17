class CreateAuthProviders < ActiveRecord::Migration
  def change
    create_table :auth_providers do |t|
      t.string :provider
      t.string :name
      t.string :key
      t.string :secret
      t.string :env

      t.timestamps
    end    
  end
end
