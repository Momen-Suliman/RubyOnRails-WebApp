class Student < ApplicationRecord
  has_and_belongs_to_many :sections
  validates :student_id, uniqueness: true, presence: true
end
