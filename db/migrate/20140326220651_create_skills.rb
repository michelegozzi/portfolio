class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :skillset_id
      t.timestamps
    end

    add_index :skills, :name
  end
end
