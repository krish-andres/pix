class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :photo, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :photos
  end
end
