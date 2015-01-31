class AddAlbumIdToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :album, index: true
    add_foreign_key :photos, :albums
  end
end
