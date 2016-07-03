class AddNameToDanceClasses < ActiveRecord::Migration
  def change
    add_column :dance_classes, :name, :string, null: false
  end
end
