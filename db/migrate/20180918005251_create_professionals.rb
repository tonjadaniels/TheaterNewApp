class CreateProfessionals < ActiveRecord::Migration[5.2]
  def change
    create_table :professionals do |t|
      t.string :name
      t.text :bio
      t.string :image

      t.timestamps
    end
  end
end
