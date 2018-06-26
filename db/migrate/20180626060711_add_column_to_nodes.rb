class AddColumnToNodes < ActiveRecord::Migration[5.2]
  def change
    add_column :nodes, :app_id, :string
    add_column :nodes, :modulation, :string
    add_column :nodes, :frequency, :float
    add_column :nodes, :data_rate, :string
    add_column :nodes, :gateway_id, :string
  end
end
