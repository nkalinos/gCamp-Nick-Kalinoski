class CreateMembership < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :role_id
    end
    create_table :roles do |t|
      t.string :name
    end
  end
end
