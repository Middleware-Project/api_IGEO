class CreateNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.string :modelName
      t.string :manufacterName
      t.string :description
      t.string :unique_id
      t.boolean :status, default: false
      t.integer :group_id

      t.timestamps
    end
  end
end
