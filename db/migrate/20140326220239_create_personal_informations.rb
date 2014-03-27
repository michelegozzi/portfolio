class CreatePersonalInformations < ActiveRecord::Migration
  def change
    create_table :personal_informations do |t|
      t.string :about
      t.timestamps
    end
  end
end
