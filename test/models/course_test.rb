require "test_helper"

class CourseTest < ActiveSupport::TestCase
  setup do
    @prefix = Prefix.create!(name: "CS")
  end

  # Test presence validation
  test "course requires a number" do
    course = Course.new(prefix: @prefix, number: nil)
    assert_not course.valid?
    assert course.errors[:number].any?
  end

  test "course with valid number is valid" do
    course = Course.new(prefix: @prefix, number: 3710)
    assert course.valid?
  end

  # Test uniqueness validation scoped to prefix
  test "course number must be unique within a prefix" do
    Course.create!(prefix: @prefix, number: 101)
    duplicate_course = Course.new(prefix: @prefix, number: 101)
    assert_not duplicate_course.valid?
    assert duplicate_course.errors[:number].any?
  end

  test "same course number can exist in different prefixes" do
    prefix2 = Prefix.create!(name: "MATH")
    Course.create!(prefix: @prefix, number: 101)
    course2 = Course.new(prefix: prefix2, number: 101)
    assert course2.valid?
  end

  # Test belongs_to relationship
  test "course must belong to a prefix" do
    course = Course.new(number: 101, prefix: nil)
    assert_not course.valid?
  end

  # Test has_many sections relationship
  test "course can have many sections" do
    course = Course.create!(prefix: @prefix, number: 101)
    section1 = course.sections.create!(section_number: "001")
    section2 = course.sections.create!(section_number: "002")
    assert_equal 2, course.sections.count
  end

  # Test dependent destroy
  test "deleting course deletes associated sections" do
    course = Course.create!(prefix: @prefix, number: 101)
    section = course.sections.create!(section_number: "001")
    section_id = section.id
    course.destroy
    assert_not Section.exists?(section_id)
  end

  # Test empty number
  test "course with empty number is invalid" do
    course = Course.new(prefix: @prefix, number: nil)
    assert_not course.valid?
  end

  # Test optional syllabus
  test "course can be created without syllabus" do
    course = Course.create!(prefix: @prefix, number: 101)
    assert course.valid?
  end

  test "course can have a syllabus" do
    course = Course.create!(prefix: @prefix, number: 101, syllabus: "This is a syllabus")
    assert_equal "This is a syllabus", course.syllabus
  end
end
