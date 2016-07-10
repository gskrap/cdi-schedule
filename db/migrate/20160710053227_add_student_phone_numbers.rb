class AddStudentPhoneNumbers < ActiveRecord::Migration
  def change
    add_column :students, :phone_number, :string
  end
end
