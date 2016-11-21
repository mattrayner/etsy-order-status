class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts do |t|
      t.integer     :etsy_id, null: false
      t.boolean     :active,  null: false,  default:  true

      t.references  :user,    null: false,  foreign: true
      t.references  :status,  null: false,  foreign: true

      t.timestamps
    end

    add_index :receipts, :etsy_id, unique: true
  end
end
