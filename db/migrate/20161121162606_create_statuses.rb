class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.string :title, null: false

      t.timestamps
    end

    add_index :statuses, :title, unique: true
  end
end
