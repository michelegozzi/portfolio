class RenameTypeToProfileTypeForContactProfiles < ActiveRecord::Migration
  def change
    rename_column :contact_profiles, :type, :profile_type
  end
end
