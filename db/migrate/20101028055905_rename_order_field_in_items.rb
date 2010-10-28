class RenameOrderFieldInItems < ActiveRecord::Migration
  def self.up
    rename_column :items, :order, :sorting_order
  end

  def self.down
    rename_column :items, :sorting_order, :order
  end
end
