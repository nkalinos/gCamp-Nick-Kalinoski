class Project < ActiveRecord::Base

  validates :name,  presence: true
  has_many :tasks, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  def owner_count
    owners_found = 0
    self.memberships.each do |membership|
      p membership.role
      if membership.role == "owner"
        owners_found += 1
      end
    end
    owners_found
  end
end
