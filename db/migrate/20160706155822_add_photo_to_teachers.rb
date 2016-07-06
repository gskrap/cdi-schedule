class AddPhotoToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :img_url, :string
  end
end
