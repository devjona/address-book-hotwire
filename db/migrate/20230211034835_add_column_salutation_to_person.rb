class AddColumnSalutationToPerson < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :salutation, :string
  end
end
