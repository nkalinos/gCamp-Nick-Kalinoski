class Membership <ActiveRecord::Base

  belongs_to :project
  belongs_to :user
  validates :role, :project_id, :user_id, presence: true
  validates_uniqueness_of :user_id, scope: :project_id
  enum role: [:member, :owner]

end
