class CreateDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :drivers do |t|
      t.references :user, foreign_key: true
      t.float :current_lat
      t.float :current_lng
      t.integer :status

      t.timestamps
    end
  end

end
