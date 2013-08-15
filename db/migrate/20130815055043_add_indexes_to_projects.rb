class AddIndexesToProjects < ActiveRecord::Migration
  def change
    add_index :projects, :sector_id
    add_index :projects, [:name, :sector_id], unique: true
  end
end
