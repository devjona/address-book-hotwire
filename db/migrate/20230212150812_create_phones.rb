class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.integer :number
      t.text :commet
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
