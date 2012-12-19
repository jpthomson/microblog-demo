class CreateAuthProviders < ActiveRecord::Migration
  def change
    create_table :auth_providers do |t|
      t.string :provider
      t.timestamps
    end    
  end
end
