class AddIndexToSectorsDescription < ActiveRecord::Migration
  def change
    add_index :sectors, :description
  end
end
