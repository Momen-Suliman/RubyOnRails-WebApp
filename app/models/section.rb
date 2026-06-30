class Section < ApplicationRecord
  belongs_to :course
  has_and_belongs_to_many :students
  validates :section_number, presence: true, uniqueness: { scope: :course_id, message: "has already been taken for this course" }
  validates :course_id, presence: true
end
