class IncreaseFileBinaryColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :leads, :file_data, :binary, :limit => 10.megabytes
  end
end
