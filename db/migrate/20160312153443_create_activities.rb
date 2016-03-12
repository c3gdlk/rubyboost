class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :recipient_id
      t.integer :owner_id
      t.integer :trackable_id
      t.string  :trackable_type
      t.string  :kind
      t.string  :message

      t.timestamps
    end

    add_index :activities, :recipient_id
    add_index :activities, :owner_id
    add_index :activities, [:trackable_id, :trackable_type]
    add_index :activities, :kind
  end
end
