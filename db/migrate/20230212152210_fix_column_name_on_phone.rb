class FixColumnNameOnPhone < ActiveRecord::Migration[6.1]
  def change
    rename_column :phones, :commet, :comment
  end
end
