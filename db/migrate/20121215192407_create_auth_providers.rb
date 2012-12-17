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
    
    AuthProvider.create :provider => :developer,
      :name => 'Developer',
      :env => :development
      
    AuthProvider.create :provider => :facebook,
      :name => 'Facebook',
      :env => :development,
      :key => '451564074911057',
      :secret => '79472d218d15752be627e5f0d0e8cb85'

    AuthProvider.create :provider => :github,
      :name => 'Github',
      :env => :development,
      :key => 'cf81ea06f7bd85e75923',
      :secret => 'a147ff6d7765e3cc7635a7a8716d6582bee60e05'
  
  end
end
