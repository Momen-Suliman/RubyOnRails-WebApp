require "test_helper"

class PrefixTest < ActiveSupport::TestCase
  # Test presence validation
  test "prefix requires a name" do
    prefix = Prefix.new(name: nil)
    assert_not prefix.valid?
    assert prefix.errors[:name].any?
  end

  test "prefix with valid name is valid" do
    prefix = Prefix.new(name: "CS")
    assert prefix.valid?
  end

  # Test uniqueness validation
  test "prefix name must be unique" do
    Prefix.create!(name: "MATH")
    duplicate_prefix = Prefix.new(name: "MATH")
    assert_not duplicate_prefix.valid?
    assert duplicate_prefix.errors[:name].any?
  end

  test "different prefix names can coexist" do
    prefix1 = Prefix.create!(name: "CS")
    prefix2 = Prefix.new(name: "MATH")
    assert prefix2.valid?
  end

  # Test empty string
  test "prefix with empty name is invalid" do
    prefix = Prefix.new(name: "")
    assert_not prefix.valid?
  end

  # Test has_many relationship
  test "prefix can have many courses" do
    prefix = Prefix.create!(name: "PHYS")
    course1 = prefix.courses.create!(number: 101)
    course2 = prefix.courses.create!(number: 102)
    assert_equal 2, prefix.courses.count
  end

  # Test dependent destroy
  test "deleting prefix destroys associated courses" do
    prefix = Prefix.create!(name: "CHEM")
    course = prefix.courses.create!(number: 101)
    prefix.destroy
    assert_not Course.exists?(course.id)
  end
end
