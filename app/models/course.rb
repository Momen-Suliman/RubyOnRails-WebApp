class Course < ApplicationRecord
  attr_accessor :skip_uniqueness_validation

  belongs_to :prefix
  has_many :sections, dependent: :delete_all
  validates :number, presence: true, uniqueness: { scope: :prefix_id }, unless: :skip_uniqueness_validation
end
