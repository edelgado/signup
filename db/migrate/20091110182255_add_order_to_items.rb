class AddOrderToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :order, :integer
  end

  def self.down
    remove_column :items, :order
  end
end
