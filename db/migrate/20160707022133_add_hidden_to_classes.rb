class AddHiddenToClasses < ActiveRecord::Migration
  def change
    add_column :dance_classes, :is_hidden, :boolean, default: false
  end
end
