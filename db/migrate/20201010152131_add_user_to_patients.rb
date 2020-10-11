class AddUserToPatients < ActiveRecord::Migration[5.2]
  def change
    add_reference :patients, :users, foreign_key: true
  end
end
