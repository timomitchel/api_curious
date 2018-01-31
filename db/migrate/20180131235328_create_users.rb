class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :full_name
      t.string :email
      t.string :url
      t.string :token
      t.boolean :expires
      t.datetime :expiration_date

      t.timestamps
    end
  end
end
