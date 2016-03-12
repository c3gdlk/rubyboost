class AddAasmStateToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :state, :string
    add_index  :articles, :state
  end
end
