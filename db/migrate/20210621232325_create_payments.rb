class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.references :ride, foreign_key: true
      t.float :value
      t.integer :status

      t.timestamps
    end
  end
end
