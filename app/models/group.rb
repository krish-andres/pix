class Group < ActiveRecord::Base
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
  has_many :albums, dependent: :destroy

  validates :name, presence: true

  has_attached_file :image, :styles => { medium: "300x300>", thumb: "100x100>", large: "640x640>"}

  validates_attachment :image, 
    presence: true,
    :content_type => { :content_type => ['image/jpeg', 'image/png'] }, 
    :size => { :less_than => 1.megabyte }
end
