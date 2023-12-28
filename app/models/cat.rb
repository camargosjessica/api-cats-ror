class Cat < ApplicationRecord
  validates :name, presence: true

  scope :sorted_by_id, -> { order(:id) }
end
