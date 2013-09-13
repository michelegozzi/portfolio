class RenameUrlToFilepathForResources < ActiveRecord::Migration
  def change
    rename_column :resources, :url, :file_path
  end
end
