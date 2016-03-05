class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :project_id

      t.timestamps null: false
    end

    add_index :articles, :project_id
  end
end
