class AddPriorityToContactProfiles < ActiveRecord::Migration
  def change
    add_column :contact_profiles, :priority, :integer
  end
end
