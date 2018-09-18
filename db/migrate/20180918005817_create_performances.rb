class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|
      t.integer :production_id
      t.date :date
      t.time :time
      t.integer :tickets_available
      t.integer :tickets_sold
      t.decimal :ticket_price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
