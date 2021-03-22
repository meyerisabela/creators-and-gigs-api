require 'rails_helper'

describe Gig do
  context 'when changing gig payment state' do
    context 'when changed to completed' do
      it 'should change gig status to paid' do
        gig = FactoryBot.create(:gig, state: 'completed')
        gig.gig_payment.update(state: 'completed')
        expect(gig.state).to eq('paid')
      end
    end
  end
end
