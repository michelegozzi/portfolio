class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :description
      t.string :url
      t.string :mime
      t.integer :project_id

      t.timestamps
    end
  end
end
