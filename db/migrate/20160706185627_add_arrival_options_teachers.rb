class AddArrivalOptionsTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :local, :boolean, default: false
    add_column :teachers, :notes, :string
  end
end
