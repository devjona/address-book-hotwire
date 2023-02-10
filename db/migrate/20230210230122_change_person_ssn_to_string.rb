class ChangePersonSsnToString < ActiveRecord::Migration[6.1]
  def change
    change_column :people, :ssn, :string
  end
end
