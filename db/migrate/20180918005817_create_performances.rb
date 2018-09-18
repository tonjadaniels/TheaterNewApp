class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|
      t.integer :production_id
      t.date :date
      t.time :time
      t.integer :tickets_available
      t.integer :tickets_sold
      t.decimal :ticket_price, precision: 5, scale: 2
<<<<<<< HEAD
=======

>>>>>>> 26456e9637d403582d79816b98f35010cdcd80f9
      t.timestamps
    end
  end
end
