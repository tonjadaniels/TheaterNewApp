class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.integer :production_id
      t.integer :professional_id
      t.string :title

      t.timestamps
    end
  end
end
