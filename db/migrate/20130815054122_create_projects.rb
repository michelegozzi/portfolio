class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :url
      t.integer :sector_id
      t.timestamps
    end
  end
end
