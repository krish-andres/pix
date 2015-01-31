class User < ActiveRecord::Base
  has_secure_password
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups
  has_many :albums


  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: /\A\S+@\S+\z/

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
end
