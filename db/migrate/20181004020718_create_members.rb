class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :password_digest
      t.boolean :volunteer, default: false
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
