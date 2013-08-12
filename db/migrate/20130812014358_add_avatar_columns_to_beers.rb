class AddAvatarColumnsToBeers < ActiveRecord::Migration
  def self.up
    add_attachment :beers, :avatar
  end

  def self.down
    remove_attachment :beers, :avatar
  end
end