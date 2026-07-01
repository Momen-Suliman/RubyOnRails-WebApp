class Course < ApplicationRecord
  belongs_to :prefix
  has_many :sections, dependent: :delete_all
  validates :number, presence: true, uniqueness: { scope: :prefix_id }
  validates :prefix, presence: true

  def prefix_name=(value)
    return if value.blank?

    self.prefix = Prefix.find_by(name: value.strip.upcase)
  end

  def prefix_name
    prefix&.name
  end
end
