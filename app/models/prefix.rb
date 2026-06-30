class Prefix < ApplicationRecord
  attr_accessor :skip_uniqueness_validation

  has_many :courses, dependent: :destroy
  validates :name, presence: true, uniqueness: true, unless: :skip_uniqueness_validation
end
