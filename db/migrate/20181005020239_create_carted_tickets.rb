class CreateCartedTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :carted_tickets do |t|
      t.integer :member_id
      t.integer :performance_id
      t.integer :order_id
      t.integer :quantity
      t.string :status

      t.timestamps
    end
  end
end
