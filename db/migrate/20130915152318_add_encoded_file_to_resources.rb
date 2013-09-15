class AddEncodedFileToResources < ActiveRecord::Migration
  def change
    add_column :resources, :encoded_file, :string
  end
end
