class StudentCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :student_courses do |t|
      t.integer :course_id
      t.integer :student_id
    end
  end
end
