class MenAndAlumniGroups < ActiveRecord::Migration
  def change
    add_column :dance_classes, :for_group_c, :boolean
    add_column :dance_classes, :for_group_d, :boolean
  end
end
