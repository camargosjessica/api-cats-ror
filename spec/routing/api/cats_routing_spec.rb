require 'rails_helper'

RSpec.describe Api::CatsController, type: :routing do
  it { should route(:get, '/api/cats').to(action: :index, format: :json) }
  it { should route(:get, '/api/cats/1').to(action: :show, id: 1, format: :json) }
  it { should route(:post, '/api/cats').to(action: :create, format: :json) }
  it { should route(:put, '/api/cats/1').to(action: :update, id: 1, format: :json) }
  it { should route(:patch, '/api/cats/1').to(action: :update, id: 1, format: :json) }
  it { should route(:delete, '/api/cats/1').to(action: :destroy, id: 1, format: :json) }
end
