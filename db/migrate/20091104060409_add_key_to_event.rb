class AddKeyToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :key, :string
  end

  def self.down
    remove_column :events, :key
  end
end
