class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
