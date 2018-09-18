class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|
      t.integer :production_id
      t.date :date
      t.time :time
      t.integer :tickets_available
      t.integer :tickets_sold
      t.decimal4 :ticket_price
      t.decimal2 :ticket_price

      t.timestamps
    end
  end
end
