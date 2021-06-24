class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.references :rider, foreign_key: true
      t.references :driver, foreign_key: true
      t.float :start_at_lat
      t.float :start_at_lng
      t.float :end_at_lat
      t.float :end_at_lng
      t.datetime :started_at
      t.datetime :ended_at
      t.float :cost
      t.float :distance
      t.float :duration
      t.string :status

      t.timestamps
    end
  end
end
