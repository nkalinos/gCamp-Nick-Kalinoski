class Registration < ActiveRecord::Base

has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :email, presence: true, uniqueness: true


end
