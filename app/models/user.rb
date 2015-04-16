class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :comments, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :projects, through: :memberships
  def full_name
    first_name + " " + last_name
  end

  def project_owner(project)
    project.memberships.find_by(role: Membership.roles["owner"], user_id: id)
  end
end
