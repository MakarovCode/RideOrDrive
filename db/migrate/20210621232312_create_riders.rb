class CreateRiders < ActiveRecord::Migration[6.1]
  def change
    create_table :riders do |t|
      t.references :user, foreign_key: true
      t.integer :points, default: 0
      t.timestamps
    end
  end

end
