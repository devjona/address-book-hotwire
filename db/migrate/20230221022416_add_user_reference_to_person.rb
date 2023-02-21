class AddUserReferenceToPerson < ActiveRecord::Migration[6.1]
  def change
    add_reference :people, :user, null: false, foreign_key: true
  end
end
