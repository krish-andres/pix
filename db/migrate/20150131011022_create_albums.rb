class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.references :user, index: true
      t.references :group, index: true

      t.timestamps null: false
    end
    add_foreign_key :albums, :users
    add_foreign_key :albums, :groups
  end
end
