class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone_number
      t.text :bio
      t.datetime :arriving
      t.datetime :leaving

      t.timestamps null: false
    end
  end
end
