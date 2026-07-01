class Section < ApplicationRecord
  belongs_to :course
  has_and_belongs_to_many :students
  validates :section_number, presence: true, uniqueness: { scope: :course_id, message: "has already been taken for this course" }
  validates :course_id, presence: true

  attr_accessor :course_name

  before_validation :assign_course_from_name, if: :course_name_present?

  def course_name_present?
    course_name.present?
  end

  def course_name
    @course_name || (course.present? ? "#{course.prefix.name} #{course.number}" : nil)
  end

  def course_name=(value)
    @course_name = value
  end

  private

  def assign_course_from_name
    return if course_id.present?

    normalized_name = course_name.to_s.strip.downcase
    return if normalized_name.blank?

    self.course = Course.joins(:prefix).find_by("LOWER(CONCAT(prefixes.name, ' ', courses.number)) = ?", normalized_name)
  end
end
