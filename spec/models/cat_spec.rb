require 'rails_helper'

RSpec.describe Cat, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:token) }
  end
end
