require 'rails_helper'

RSpec.describe Cat, type: :model do
  subject(:cat) { build :cat }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:token) }
    it { should validate_length_of(:token).is_at_least(10) }
    it { should validate_uniqueness_of(:name).scoped_to(:token).case_insensitive }
  end

  describe 'scope' do
    it '#by_token' do
      expect(Cat.where(token: cat.token).to_sql).to eq Cat.by_token(cat.token).to_sql
    end
    it '#search' do
      expect(Cat.where('LOWER(name) LIKE ?', "%#{cat.name.downcase}%").to_sql).to eq Cat.search(cat.name).to_sql
    end
    it '#sorted_by_id' do
      expect(Cat.order(:id).to_sql).to eq Cat.sorted_by_id.to_sql
    end
  end
end
