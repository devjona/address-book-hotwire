class UpdateAddressFieldsNullFalse < ActiveRecord::Migration[6.1]
  def change
    change_column_null :addresses, :street, false
    change_column_null :addresses, :town, false
    change_column_null :addresses, :zip, false
  end
end
