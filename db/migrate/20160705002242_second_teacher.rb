class SecondTeacher < ActiveRecord::Migration
  def change
    add_column :dance_classes, :second_teacher_id, :integer
  end
end
