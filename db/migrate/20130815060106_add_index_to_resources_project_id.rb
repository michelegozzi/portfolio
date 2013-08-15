class AddIndexToResourcesProjectId < ActiveRecord::Migration
  def change
    add_index :resources, :project_id
  end
end
