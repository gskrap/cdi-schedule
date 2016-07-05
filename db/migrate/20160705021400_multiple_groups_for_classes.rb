class MultipleGroupsForClasses < ActiveRecord::Migration
  def change
    remove_column :dance_classes, :group_id

    add_column :dance_classes, :for_group_a, :boolean
    add_column :dance_classes, :for_group_b, :boolean
  end
end
