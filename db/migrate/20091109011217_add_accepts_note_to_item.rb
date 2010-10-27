class AddAcceptsNoteToItem < ActiveRecord::Migration
  def self.up
    add_column :items, :accepts_note, :boolean
  end

  def self.down
    remove_column :items, :accepts_note
  end
end
