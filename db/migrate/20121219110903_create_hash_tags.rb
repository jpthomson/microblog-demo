class CreateHashTags < ActiveRecord::Migration
  def change
    create_table :hash_tags do |t|
      t.references :bleat
      t.string :tag

      t.timestamps
    end
    add_index :hash_tags, :bleat_id
    add_index :hash_tags, :tag
  end
end
