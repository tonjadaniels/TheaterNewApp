class CreateProductions < ActiveRecord::Migration[5.2]
  def change
    create_table :productions do |t|
      t.string :title
      t.text :synopsis_short
      t.text :synopsis_long
      t.string :image_small
      t.string :image_large

      t.timestamps
    end
  end
end
