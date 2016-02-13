class SetDefaultTrueToProjectActiveField < ActiveRecord::Migration
  def change
    change_column :projects, :active, :boolean, default: true, null: false
  end
end
