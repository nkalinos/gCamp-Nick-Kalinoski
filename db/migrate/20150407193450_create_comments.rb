class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :message
      t.belongs_to :user
      t.belongs_to :task
      
    end
  end
end
