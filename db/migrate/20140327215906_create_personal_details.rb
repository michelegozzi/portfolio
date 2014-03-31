class CreatePersonalDetails < ActiveRecord::Migration
  def change
    create_table :personal_details do |t|
      t.string :about
      t.timestamps
    end
  end
end
