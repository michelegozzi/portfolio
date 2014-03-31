class AddUniqueIndexToSkills < ActiveRecord::Migration
  def change
    add_index :skills, [:skillset_id, :name], unique: true
  end
end
