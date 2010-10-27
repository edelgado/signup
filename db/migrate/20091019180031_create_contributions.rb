class CreateContributions < ActiveRecord::Migration
  def self.up
    create_table :contributions do |t|
      t.integer :item_id
      t.integer :contributor_id
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :contributions
  end
end
