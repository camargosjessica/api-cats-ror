require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe '/api/cats', type: :request do
  let(:valid_attributes) { attributes_for :cat }
  let(:invalid_attributes) { attributes_for :invalid_cat }

  let(:valid_headers) do
    { Authorization: valid_attributes[:token] }
  end
  let(:invalid_headers) do
    { Authorization: '123456789' }
  end

  describe 'GET /index' do
    context 'with headers' do
      it 'renders a successful response' do
        cat = Cat.create! valid_attributes
        get api_cats_url, headers: valid_headers, as: :json
        expect(response).to be_successful
        expect(json_response[0][:name]).to eq cat.name
      end
    end

    context 'without headers' do
      it 'renders a JSON response with an unauthorized status' do
        get api_cats_url, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with invalid headers' do
      it 'renders a JSON response with an unauthorized status' do
        get api_cats_url, headers: invalid_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      cat = Cat.create! valid_attributes
      get api_cat_url(cat), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Cat' do
        expect do
          post api_cats_url,
               params: { cat: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Cat, :count).by(1)
      end

      it 'renders a JSON response with the new cat' do
        post api_cats_url,
             params: { cat: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Cat' do
        expect do
          post api_cats_url,
               params: { cat: invalid_attributes }, headers: valid_headers, as: :json
        end.to change(Cat, :count).by(0)
      end

      it 'renders a JSON response with errors for the new cat' do
        post api_cats_url,
             params: { cat: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { attributes_for :cat }

      it 'updates the requested cat' do
        cat = Cat.create! valid_attributes
        patch api_cat_url(cat),
              params: { cat: new_attributes }, headers: valid_headers, as: :json
        cat.reload
        expect(cat.name).to eq(new_attributes[:name])
      end

      it 'renders a JSON response with the cat' do
        cat = Cat.create! valid_attributes
        patch api_cat_url(cat),
              params: { cat: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the cat' do
        cat = Cat.create! valid_attributes
        patch api_cat_url(cat),
              params: { cat: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested cat' do
      cat = Cat.create! valid_attributes
      expect do
        delete api_cat_url(cat), headers: valid_headers, as: :json
      end.to change(Cat, :count).by(-1)
    end
  end
end
