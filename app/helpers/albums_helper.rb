module AlbumsHelper

  def image_for(album)
    unless album.photos.empty?
      image_tag(album.photos.first.image.url(:medium))
    else
      image_tag('placeholder.jpg')
    end
  end
end
