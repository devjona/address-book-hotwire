class MakePhoneNullFalse < ActiveRecord::Migration[6.1]
  def change
    change_column_null :phones, :number, false
  end
end
