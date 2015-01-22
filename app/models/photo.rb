class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { medium: "300x300>", thumb: "100x100>", large: "640x640>"}

  validates_attachment :image, 
    presence: true,
    :content_type => { :content_type => ['image/jpeg', 'image/png'] }, 
    :size => { :less_than => 1.megabyte }
end
