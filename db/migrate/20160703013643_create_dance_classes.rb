class CreateDanceClasses < ActiveRecord::Migration
  def change
    create_table :dance_classes do |t|
      t.datetime :start, null: false
      t.datetime :end, null: false
      t.integer :group_id
      t.integer :teacher_id
      t.integer :location_id
      t.string :style

      t.timestamps null: false
    end
  end
end
