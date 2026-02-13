class ChangeStudentIdToInteger < ActiveRecord::Migration[8.0]
  def change
    change_column :students, :student_id, :integer
  end
end
