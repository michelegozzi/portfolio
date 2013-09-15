class RenameIconToIconClassForContactProfiles < ActiveRecord::Migration
  def change
    rename_column :contact_profiles, :icon, :icon_class
  end
end
