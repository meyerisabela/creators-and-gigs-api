require 'rails_helper'

describe 'Creators API', type: :request do
  context 'when requesting all the creators (GET creators#index)' do
    it 'should return all creators' do
      FactoryBot.create(:creator)
      FactoryBot.create(:creator)

      get '/api/v1/creators'

      expect(JSON.parse(response.body).count).to eq(2)
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end

  context 'when passing an id as a parameter (GET creators#show)' do
    it 'should return the creator by it\'s id' do
      creator = FactoryBot.create(:creator)
      get "/api/v1/creators/#{creator.id}"

      expect(response).to render_template(:show)
    end
  end

  context 'when requesting to save a new creator (GET creators#create)' do
    it 'should save a new creator to the db' do
      expect {
        post '/api/v1/creators',
        params: { creator: { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name } }
      }.to change { Creator.count }.by(1)

      expect(response).to render_template(:show)
    end
  end
end
