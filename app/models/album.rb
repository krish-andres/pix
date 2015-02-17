class Album < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :photos, dependent: :destroy

  validates :name, presence: true
end
