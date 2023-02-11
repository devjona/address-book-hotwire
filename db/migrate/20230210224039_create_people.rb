class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :firstname, null: false
      t.string :middlename
      t.string :lastname, null: false
      t.integer :ssn
      t.date :birthdate
      t.text :comment

      t.timestamps
    end
  end
end
