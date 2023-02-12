class UpdatePhoneNumberToString < ActiveRecord::Migration[6.1]
  def change
    change_column :phones, :number, :string, null: false
  end
end
