class CreateContactProfiles < ActiveRecord::Migration
  def change
    create_table :contact_profiles do |t|
      t.string :name
      t.string :icon
      t.integer :type
      t.string :value

      t.timestamps
    end
  end
end
