class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :uuid, uniq: true
      t.string :auth_token, uniq: true
      t.string :refresh_token, uniq: true
      t.string :access_token, uniq: true
      t.datetime :access_token_expired_at
      t.string :name
      t.string :email, uniq: true
      t.string :phone, uniq: true
      t.string :role

      t.timestamps
    end
  end
end
