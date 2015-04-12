class ChangeMembershipRole < ActiveRecord::Migration
  def change
    rename_column :memberships, :role_id, :role
  end
end
