class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { medium: "300x300>", thumb: "100x100>"}

  validates_attachment :image, 
    :content_type => { :content_type => ['image/jpeg', 'image/png'] }, 
    :size => { :less_than => 1.megabyte }
end
