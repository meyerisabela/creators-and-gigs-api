require 'rails_helper'

describe Gig do
  context 'when saving a new gig' do
    context 'when it doesn\'t have a brand name' do
      it 'doesn\'t create the gig' do
        gig = FactoryBot.build(:gig, brand_name: nil)
        expect(gig).not_to be_valid
      end
    end

    context 'when it does have a brand name' do
      it 'creates the gig' do
        gig = FactoryBot.build(:gig)
        expect(gig).to be_valid
      end
    end

    context 'when it doesn\'t have a creator' do
      it 'doesn\'t create the gig' do
        gig = FactoryBot.build(:gig, creator: nil)
        expect(gig).not_to be_valid
      end
    end

    context 'when it has a creator' do
      it 'creates the gig' do
        gig = FactoryBot.build(:gig)
        expect(gig).to be_valid
      end
    end
  end

  context 'when changing gig status' do
    context 'when state is completed' do
      it 'it creates a gig payment' do
        gig = FactoryBot.create(:gig, state: 'completed')

        expect(gig.gig_payment).to be_valid
      end
    end

    context 'when state is not completed' do
      it 'it doesn\'t creates a gig payment' do
        gig = FactoryBot.create(:gig)
        expect(gig.gig_payment).to be_nil
      end
    end
  end
end
