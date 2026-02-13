class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.references :prefix, null: false, foreign_key: true
      t.integer :number
      t.text :syllabus

      t.timestamps
    end
  end
end
