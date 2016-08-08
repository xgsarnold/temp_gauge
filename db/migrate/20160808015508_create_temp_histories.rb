class CreateTempHistories < ActiveRecord::Migration
  def change
    create_table :temp_histories do |t|

      t.timestamps null: false
    end
  end
end
