class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :beer
      t.references :user
      t.integer :rank

      t.timestamps
    end
    add_index :ratings, :beer_id
    add_index :ratings, :user_id
  end
end
