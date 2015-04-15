class Membership <ActiveRecord::Base

  belongs_to :project
  belongs_to :user
  validates :project_id, :user_id, presence: true
  validates_uniqueness_of :user_id, scope: :project_id
  enum role: {member: 0, owner: 1}

  def self.capital_roles
    roles.map{|name, value| [name.capitalize, name]}
  end
end
