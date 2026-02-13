require "test_helper"

class StudentTest < ActiveSupport::TestCase
  # Test presence validations
  test "student requires a name" do
    student = Student.new(name: nil, student_id: 100001)
    assert_not student.valid?
    assert student.errors[:name].any?
  end

  test "student requires a student_id" do
    student = Student.new(name: "Alice", student_id: nil)
    assert_not student.valid?
    assert student.errors[:student_id].any?
  end

  test "student with valid name and student_id is valid" do
    student = Student.new(name: "Alice", student_id: 100001)
    assert student.valid?
  end

  # Test empty string
  test "student with empty name is invalid" do
    student = Student.new(name: "", student_id: 100001)
    assert_not student.valid?
  end

  test "student with empty student_id is invalid" do
    student = Student.new(name: "Alice", student_id: nil)
    assert_not student.valid?
  end

  # Test has_and_belongs_to_many sections relationship
  test "student can be enrolled in many sections" do
    student = Student.create!(name: "Alice", student_id: 100001)
    prefix = Prefix.create!(name: "CS")
    course1 = Course.create!(prefix: prefix, number: 3710)
    course2 = Course.create!(prefix: prefix, number: 3000)
    section1 = Section.create!(course: course1, section_number: "001")
    section2 = Section.create!(course: course2, section_number: "001")

    student.sections << section1
    student.sections << section2
    assert_equal 2, student.sections.count
  end

  # Test adding and removing from sections
  test "can add student to section" do
    student = Student.create!(name: "Bob", student_id: 100002)
    prefix = Prefix.create!(name: "MATH")
    course = Course.create!(prefix: prefix, number: 2010)
    section = Section.create!(course: course, section_number: "001")

    section.students << student
    assert section.students.include?(student)
  end

  test "can remove student from section" do
    student = Student.create!(name: "Charlie", student_id: 100003)
    prefix = Prefix.create!(name: "PHYS")
    course = Course.create!(prefix: prefix, number: 2110)
    section = Section.create!(course: course, section_number: "001")

    section.students << student
    section.students.delete(student)
    assert_not section.students.include?(student)
  end

  # Test student_id as integer
  test "student_id should be an integer" do
    student = Student.create!(name: "Diana", student_id: 100004)
    assert_kind_of Integer, student.student_id
  end

  # Test multiple students with different IDs
  test "multiple students can exist" do
    student1 = Student.create!(name: "Eve", student_id: 100005)
    student2 = Student.create!(name: "Frank", student_id: 100006)
    assert_equal 2, [ student1, student2 ].count
    assert_not_equal student1.student_id, student2.student_id
  end
end
