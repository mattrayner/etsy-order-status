class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :etsy_id, null: false

      t.timestamps
    end

    add_index :users, :etsy_id, unique: true
  end
end
