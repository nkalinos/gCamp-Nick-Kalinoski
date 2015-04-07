class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :comments, dependent: :destroy
  def full_name
    first_name + " " + last_name
  end
end
