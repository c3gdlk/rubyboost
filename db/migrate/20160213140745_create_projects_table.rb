class CreateProjectsTable < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string  :title
      t.boolean :active

      t.timestamps
    end
  end
end
