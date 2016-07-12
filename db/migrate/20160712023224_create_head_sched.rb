class CreateHeadSched < ActiveRecord::Migration
  def change
    create_table :head_scheds do |t|
      t.integer :dance_class_id, null: false
      t.text :body

      t.timestamps null: false
    end
  end
end
