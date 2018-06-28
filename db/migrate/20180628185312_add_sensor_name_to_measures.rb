class AddSensorNameToMeasures < ActiveRecord::Migration[5.2]
  def change
    add_column :measures, :sensor_name, :string
  end
end
