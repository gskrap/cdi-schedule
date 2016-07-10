class WorkStudyForUsers < ActiveRecord::Migration
  def change
    add_column :users, :work_study, :boolean, default: false
  end
end
