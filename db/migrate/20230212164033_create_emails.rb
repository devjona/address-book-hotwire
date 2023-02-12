class CreateEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :emails do |t|
      t.string :address, null: false
      t.string :comment
      t.references :people, null: false, foreign_key: true

      t.timestamps
    end
  end
end
