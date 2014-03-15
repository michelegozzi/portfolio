class CreateDispatches < ActiveRecord::Migration
  def change
    create_table :dispatches do |t|

      t.timestamps
    end
  end
end
