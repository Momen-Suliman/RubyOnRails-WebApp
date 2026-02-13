class Section < ApplicationRecord
  belongs_to :course
  has_and_belongs_to_many :students
  validates :section_number, presence: true
  validates :course_id, presence: true
end
