class Section < ApplicationRecord
  attr_accessor :skip_uniqueness_validation

  belongs_to :course
  has_and_belongs_to_many :students
  validates :section_number, presence: true, uniqueness: { scope: :course_id, message: "has already been taken for this course" }, unless: :skip_uniqueness_validation
  validates :course_id, presence: true

  before_validation :assign_default_section_number, on: %i[create update], if: :allow_default_section_number?

  private

  def allow_default_section_number?
    skip_uniqueness_validation && section_number.blank?
  end

  def assign_default_section_number
    self.section_number = next_available_section_number
  end

  def next_available_section_number
    existing_numbers = Section.where(course_id: course_id).where.not(id: id).pluck(:section_number).compact.map(&:to_i)
    next_number = existing_numbers.max.to_i + 1
    next_number.to_s.rjust(3, "0")
  end
end
