class ChangeForeignKeyOnEmailToPersonId < ActiveRecord::Migration[6.1]
  def change
    rename_column :emails, :people_id, :person_id
  end
end
