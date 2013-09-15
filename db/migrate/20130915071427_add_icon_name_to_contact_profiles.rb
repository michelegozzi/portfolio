class AddIconNameToContactProfiles < ActiveRecord::Migration
  def change
    add_column :contact_profiles, :icon_name, :string
  end
end
