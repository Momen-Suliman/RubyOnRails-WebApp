class CreateJoinTableSectionsStudents < ActiveRecord::Migration[8.0]
  def change
    create_join_table :sections, :students do |t|
      # t.index [:section_id, :student_id]
      # t.index [:student_id, :section_id]
    end
  end
end
