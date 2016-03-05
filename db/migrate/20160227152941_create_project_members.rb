class CreateProjectMembers < ActiveRecord::Migration
  def change
    create_table :project_users do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end

    add_index :project_users, [:user_id, :project_id], unique: true
  end
end
