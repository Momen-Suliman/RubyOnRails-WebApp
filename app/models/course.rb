class Course < ApplicationRecord
  belongs_to :prefix
  has_many :sections, dependent: :delete_all
  validates :number, presence: true, uniqueness: { scope: :prefix_id }
end
