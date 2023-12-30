class Cat < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :token, case_sensitive: false }
  validates :token, presence: true, length: { minimum: 10 }

  scope :search, ->(term) { where('LOWER(name) LIKE ?', "%#{term.downcase}%") if term.present? }
  scope :by_token, ->(token) { where(token:) }
  scope :sorted_by_id, -> { order(:id) }
end
