class RenameMimeToMimetypeForResources < ActiveRecord::Migration
  def change
    rename_column :resources, :mime, :mime_type
  end
end
