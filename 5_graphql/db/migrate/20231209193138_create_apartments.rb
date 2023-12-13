class CreateApartments < ActiveRecord::Migration[7.0]
  def change
    create_table :apartments do |t|
      t.string :room_type
      t.string :description
      t.integer :resort_id

      t.timestamps
    end
  end
end
