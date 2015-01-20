class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image

  validates_attachment :image, 
    :content_type => { :content_type => ['image/jpeg', 'image/png'] }, 
    :size => { :less_than => 1.megabyte }
end
