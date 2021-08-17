require 'rails_helper'
# check end to end tests
describe 'Gigs API', type: :request do
  context 'when requesting all the gigs (GET gigs#index)' do
    it 'should return all gigs' do
      FactoryBot.create(:gig)
      FactoryBot.create(:gig)

      get '/api/v1/gigs'

      expect(JSON.parse(response.body).count).to eq(2)
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end

  context 'when passing an id as a parameter (GET gigs#show)' do
    it 'should return the gig by it\'s id' do
      gig = FactoryBot.create(:gig)

      get "/api/v1/gigs/#{gig.id}"

      expect(response).to render_template(:show)
    end
  end

  context 'when requesting to save a new gig (GET gigs#create)' do
    it 'should save a new gig to the db' do
      creator = FactoryBot.create(:creator)

      expect {
        post "/api/v1/creators/#{creator.id}/gigs",
        params: { gig: { brand_name: Faker::Company.name } }
      }.to change { Gig.count }.by(1)

      expect(response).to render_template(:show)
    end
  end

  context 'when requesting to update a gig (GET gigs#update)' do
    it 'should update the gig in the db' do
      gig = FactoryBot.create(:gig)

      patch "/api/v1/gigs/#{gig.id}", params: { gig: { state: 'completed' } }
      gig.reload
      expect(gig.state).to eq('completed')

      expect(response).to render_template(:show)
    end
  end
end
