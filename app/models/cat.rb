class Cat < ApplicationRecord
  validates :name, presence: true

  scope :search, ->(term) { where('LOWER(name) LIKE ?', "%#{term.downcase}%") if term.present?}

  scope :sorted_by_id, -> { order(:id) }
end
