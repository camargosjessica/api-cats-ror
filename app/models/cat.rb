class Cat < ApplicationRecord
  validates :name, :token, presence: true
  validates :name, uniqueness: { scope: :token, case_sensitive: false }

  scope :search, ->(term) { where('LOWER(name) LIKE ?', "%#{term.downcase}%") if term.present? }
  scope :by_token, ->(token) { where(token:) }
  scope :sorted_by_id, -> { order(:id) }
end
