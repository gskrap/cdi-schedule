class RemovePhotoFromTeachers < ActiveRecord::Migration
  def change
    remove_column :teachers, :img_url
  end
end
