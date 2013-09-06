class AddIconToSectors < ActiveRecord::Migration
  def change
    add_column :sectors, :icon_name, :string
    add_column :sectors, :icon_class, :string
  end
end
