require "test_helper"

class SectionTest < ActiveSupport::TestCase
  setup do
    @prefix = Prefix.create!(name: "CS")
    @course = Course.create!(prefix: @prefix, number: 3710)
  end

  # Test presence validation for course_id
  test "section requires a course" do
    section = Section.new(course: nil, section_number: "001")
    assert_not section.valid?
    assert section.errors[:course_id].any?
  end

  test "section with valid course is valid" do
    section = Section.new(course: @course, section_number: "001")
    assert section.valid?
  end

  # Test belongs_to relationship
  test "section belongs to a course" do
    section = Section.create!(course: @course, section_number: "001")
    assert_equal @course, section.course
  end

  # Test has_and_belongs_to_many students relationship
  test "section can have many students" do
    section = Section.create!(course: @course, section_number: "001")
    student1 = Student.create!(name: "Alice", student_id: 100001)
    student2 = Student.create!(name: "Bob", student_id: 100002)
    section.students << student1
    section.students << student2
    assert_equal 2, section.students.count
  end

  # Test dependent delete (sections deleted when course deleted)
  test "deleting course destroys sections with dependent delete_all" do
    section = Section.create!(course: @course, section_number: "001")
    section_id = section.id
    @course.destroy
    assert_not Section.exists?(section_id)
  end

  # Test section_number is required
  test "section requires a section_number" do
    section = Section.new(course: @course, section_number: nil)
    assert_not section.valid?
    assert section.errors[:section_number].any?
  end

  test "section can be created with section_number" do
    section = Section.create!(course: @course, section_number: "001")
    assert_equal "001", section.section_number
  end

  # Test adding and removing students
  test "can add and remove students from section" do
    section = Section.create!(course: @course, section_number: "001")
    student = Student.create!(name: "Charlie", student_id: 100003)
    section.students << student
    assert section.students.include?(student)
    section.students.delete(student)
    assert_not section.students.include?(student)
  end
end
