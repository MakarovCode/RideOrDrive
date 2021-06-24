class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.references :user, foreign_key: true
      t.string :token
      t.string :name
      t.string :brand
      t.string :holder
      t.string :exp_at

      t.timestamps
    end
  end
end
