class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.references :brewer

      t.timestamps
    end
    add_index :beers, :brewer_id
  end
end
