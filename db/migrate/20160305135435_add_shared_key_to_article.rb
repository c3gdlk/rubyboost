class AddSharedKeyToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :shared_key, :string
  end
end
