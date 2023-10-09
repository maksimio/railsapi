class CreateApplies < ActiveRecord::Migration[7.0]
  def change
    create_table :applies do |t|
      t.boolean :read
      t.boolean :invited
      t.string :geek_id

      t.timestamps
    end
  end
end
