class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :description

      t.timestamps
    end
  end
end
