class RenameDescriptionToDisplaynameForResources < ActiveRecord::Migration
  def change
    rename_column :resources, :description, :display_name
  end
end
